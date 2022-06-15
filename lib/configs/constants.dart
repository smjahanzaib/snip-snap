import 'package:flutter/material.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';

typedef ToolbarOptionModelCallback = void Function(
    ToolbarOptionModel sortModel);

const String kAppName = 'Snip Snap';
const String kAppVersion = '1.3.0';

/// Default theme font.
///
/// Use null for system font or font name declared in pubspec.yaml like Roboto
/// or Raleway.
const String kFontFamily = null;

// Date/time formats
const String kDateFormat = 'MMM d, y';
const String kDateTimeFormat = 'MMM d, y HH:mm';
const String kTimeFormat = 'HH:mm';

// Various Sizes
const double kBottomBarIconSize = 32.0;
const double kBoxDecorationRadius = 8.0;
const double kFormFieldsRadius = 6.0;
const double kRoundedButtonRadius = 24.0;
const double kCardRadius = 24.0;
const double kBadgeRadius = 16.0;
const double kTimelineDateSize = 88.0;

// Colors
const Color kPrimaryColor = Color(0xFFEE2A7B);
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF000000);
const Color kGold = Color(0xFFF3C952);
const Color kTransparent = Colors.transparent;

// Padding
const double kPaddingS = 10.0;
const double kPaddingM = 20.0;
const double kPaddingL = 40.0;

// Avatar sizes
const double kCircleAvatarSizeRadiusAppBar = 20.0;
const double kCircleAvatarSizeRadiusSmall = 24.0;
const double kCircleAvatarSizeRadiusLarge = 48.0;

// Animations
const Duration kRippleAnimationDuration = Duration(milliseconds: 600);
const Duration kButtonAnimationDuration = Duration(milliseconds: 200);
const Duration kPaymentCardAnimationDuration = Duration(milliseconds: 500);

/// Reservations date range in days.
const int kReservationsDateRange = 7;

/// Reservations per page.
const int kReservationsPerPage = 10;

/// Reviews per page.
const int kReviewsPerPage = 10;

/// Minimal query string length.
const int kMinimalNameQueryLength = 3;

/// Minimal password string length.
const int kMinimalPasswordLength = 8;

/// SnackBar duration in miliseconds (short).
const int kSnackBarDurationShort = 2500;

/// SnackBar duration in miliseconds (long).
const int kSnackBarDurationLong = 10000;

// Default geo position
const double kDefaultLat = 37.789682;
const double kDefaultLon = -122.3923026;

/// Default locale.
const Locale kDefaultLocale = Locale('en');

/// Review comment length limit.
const int kReviewLengthLimit = 400;

/// Terms of service URL.
const String kTermsOfServiceURL = 'https://www.google.com';

/// Privacy policy URL.
const String kPrivacyPolicyURL = 'https://envato.com/privacy/';

/// Template homepage URL.
const String kHomepageURL = 'https://www.google.com/';

/// Password match regex string.
///
/// - Require that at least one digit appear anywhere in the string
/// - Require that at least one uppercase letter appear anywhere in the string
/// - The password must be at least 8 characters long
const String kPasswordRegex = r'^(?=.*[0-9])(?=.*[A-Z]).{8,}$';

/// Demo account email address.
const String kDemoEmail = 'admin@example.com';

/// Demo account password.
const String kDemoPassword = 'Password1';

/// Currency used in the application.
const String kCurrency = 'USD';

/// Logz.io Token for remote logging.
/// Settings > General > Account Settings
const String kLogzioToken = 'flqmcXGLTlkodgJqPSpNpFCblcRQvukD';

/// Logz.io remote Url.
/// This largely depends which region you selected during registration.
const String kLogzioUrl = 'https://listener-uk.logz.io:8071/';

/// Assets images
class AssetsImages {
  static const String onboardingWelcome =
      'assets/images/onboarding/welcome.png';
  static const String onboardingFind = 'assets/images/onboarding/find.png';
  static const String onboardingAppointment =
      'assets/images/onboarding/appointment.png';
  static const String homeWavyHeader = 'assets/images/makeup.jpg';
  static const String loginBackground = 'assets/images/hair.jpg';
  static const String mapMarker = 'assets/images/map-marker.png';
  static const String icon = 'assets/images/icon.png';
  static const String chip = 'assets/images/cc/chip.png';
  static const String cardVisa = 'assets/images/cc/visa.png';
  static const String cardAmex = 'assets/images/cc/amex.png';
  static const String cardDiscover = 'assets/images/cc/discover.png';
  static const String cardMastercard = 'assets/images/cc/mastercard.png';
}

/// Preference keys used to store/read values using [AppPreferences].
class PreferenceKey {
  static const String appVersion = 'appVersion';
  static const String isOnboarded = 'isOnboarded';
  static const String user = 'user';
  static const String language = 'language';
  static const String notification = 'notification';
  static const String darkOption = 'darkOption';
}
