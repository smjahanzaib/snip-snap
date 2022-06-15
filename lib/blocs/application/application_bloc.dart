import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/blocs/theme/theme_bloc.dart';
import 'package:SnipSnap/configs/app_theme.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/repositories/location_repository.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/utils/app_preferences.dart';
import 'package:SnipSnap/utils/console.dart';
import 'package:SnipSnap/utils/string.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    this.authBloc,
    this.themeBloc,
  }) : super(InitialApplicationState());

  final AuthBloc authBloc;
  final ThemeBloc themeBloc;

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is SetupApplicationEvent) {
      yield* _mapSetupApplicationEventToState();
    } else if (event is LocationServicesInitedApplicationEvent) {
      yield* _mapInitLocationServicesApplicationEventToState();
    } else if (event is SettingsLoadedApplicationEvent) {
      yield* _mapLoadSettingsApplicationEventToState();
    } else if (event is OnboardingCompletedApplicationEvent) {
      yield* _mapCompletedOnboardingApplicationEventToState();
    } else if (event is LifecycleChangedApplicationEvent) {
      yield* _mapLifecycleChangedApplicationEventToState(event);
    } else if (event is ChangeRequestedLanguageApplicationEvent) {
      yield* _mapChangeRequestedLanguageApplicationEventToState(event);
    }
  }

  Stream<ApplicationState> _mapSetupApplicationEventToState() async* {
    yield SetupInProgressApplicationState();

    /// Load server/global settings.
    add(SettingsLoadedApplicationEvent());

    /// Get the previously selected language from preferences.
    final String selectedLanguage =
        getIt.get<AppPreferences>().getString(PreferenceKey.language);

    /// Save current language to globals.
    if (selectedLanguage.isNullOrEmpty) {
      add(ChangeRequestedLanguageApplicationEvent(kDefaultLocale));
    } else {
      add(ChangeRequestedLanguageApplicationEvent(Locale(selectedLanguage)));
    }

    /// Get the previously selected dark option from preferences.
    final String selectedDarkOption =
        getIt.get<AppPreferences>().getString(PreferenceKey.darkOption);

    /// Deafult dark option is 'dynamic'.
    DarkOption darkOption = DarkOption.dynamic;

    // Validate the selected dark option.
    if (selectedDarkOption.isNotNullOrEmpty) {
      darkOption = DarkOption.values.firstWhere(
          (DarkOption e) => e.toString() == selectedDarkOption,
          orElse: () => DarkOption.dynamic);
    }
    // Save the dark option value for future use.
    getIt.get<AppGlobals>().darkThemeOption = darkOption;
    themeBloc.add(ChangeRequestedThemeEvent(
        darkOption: getIt.get<AppGlobals>().darkThemeOption));

    /// Get the current app version.
    final String oldVersion =
        getIt.get<AppPreferences>().getString(PreferenceKey.appVersion);

    /// Is the user onboarded already?
    getIt.get<AppGlobals>().isUserOnboarded =
        getIt.get<AppPreferences>().containsKey(PreferenceKey.isOnboarded);

    // New install/version?
    if (oldVersion != kAppVersion) {
      // Save the new version info.
      await getIt
          .get<AppPreferences>()
          .setString(PreferenceKey.appVersion, kAppVersion);
      // Clear logged in user info, and force to re-login.
      // await getIt.get<AppPreferences>().remove(PreferenceKey.user);
    } else {
      if (getIt.get<AppGlobals>().isUserOnboarded) {
        // Validate token/profile data if exists
        authBloc.add(ProfileLoadedAuthEvent());
      }
    }

    // If user is onboarded, continue to location services initialization.
    if (getIt.get<AppGlobals>().isUserOnboarded) {
      /// Init location services.
      add(LocationServicesInitedApplicationEvent());
    } else {
      //yield SetupSuccessApplicationState();
    }
  }

  Stream<ApplicationState> _mapLoadSettingsApplicationEventToState() async* {
    yield LoadSettingsInProgressApplicationState();

    getIt.get<AppGlobals>().categories =
        await const LocationRepository().getCategories();

    yield LoadSettingsSuccessApplicationState();
  }

  Stream<ApplicationState>
      _mapInitLocationServicesApplicationEventToState() async* {
    // LocationAccuracy.powerSave may cause infinite loops on Android
    // while calling getLocation().
    getIt.get<Location>().changeSettings(accuracy: LocationAccuracy.low);

    /// Checks if the location service is enabled.
    try {
      bool serviceEnabled = await getIt.get<Location>().serviceEnabled();
      if (serviceEnabled == null || !serviceEnabled) {
        /// Request the activation of the location service.
        final bool serviceRequestedResult =
            await getIt.get<Location>().requestService();
        serviceEnabled = serviceRequestedResult;
      }

      /// Checks if the app has permission to access location.
      PermissionStatus permissionGranted =
          await getIt.get<Location>().hasPermission();
      if (permissionGranted != PermissionStatus.granted) {
        final PermissionStatus permissionRequestedResult =
            await getIt.get<Location>().requestPermission();
        permissionGranted = permissionRequestedResult;
      }
      if (permissionGranted == PermissionStatus.granted) {
        /// getLocation() may loop forever on emulators if location is set to 'None'!
        ///
        //if (!getIt.get<AppGlobals>().isAnEmulator || kReleaseMode) {
        //  getIt.get<AppGlobals>().currentPosition = await getIt.get<Location>().getLocation();
        //} else {
        getIt.get<AppGlobals>().currentPosition =
            LocationData.fromMap(<String, double>{
          'latitude': kDefaultLat,
          'longitude': kDefaultLon,
          'accuracy': 0.0,
          'altitude': 0.0,
          'speed': 0.0,
          'speed_accuracy': 0.0,
          'heading': 0.0,
          'time': 0.0,
        });
        //}
      }
    } catch (e) {
      Console.log('Location ERROR', e.toString(), error: e);
    }

    // Setup is completed. On the main screen.
    yield SetupSuccessApplicationState();
  }

  Stream<ApplicationState>
      _mapCompletedOnboardingApplicationEventToState() async* {
    // Save the info about completed onboarding process to shared preferences.
    await getIt.get<AppPreferences>().setBool(PreferenceKey.isOnboarded, true);

    getIt.get<AppGlobals>().isUserOnboarded = true;

    /// Init the locations services via [ApplicationBloc] event.
    add(LocationServicesInitedApplicationEvent());
  }

  Stream<ApplicationState> _mapLifecycleChangedApplicationEventToState(
      LifecycleChangedApplicationEvent event) async* {
    yield LifecycleChangeInProgressApplicationState(event.state);
  }

  Stream<ApplicationState> _mapChangeRequestedLanguageApplicationEventToState(
      ChangeRequestedLanguageApplicationEvent event) async* {
    yield UpdateLanguageInProgressApplicationState();

    getIt.get<AppGlobals>().selectedLocale = event.locale;

    await getIt
        .get<AppPreferences>()
        .setString(PreferenceKey.language, event.locale.toString());

    L10n.load(event.locale);

    yield UpdateLanguageSuccessApplicationState();
  }
}
