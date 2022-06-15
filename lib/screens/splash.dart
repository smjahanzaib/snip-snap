import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/application/application_bloc.dart';
import 'package:SnipSnap/widgets/full_screen_indicator.dart';

/// Splash screen shown while the app is loading.
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<ApplicationBloc>(context).add(SetupApplicationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const FullScreenIndicator();
}
