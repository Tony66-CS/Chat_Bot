import 'package:flutter/material.dart';
import 'package:tonyyyyyy/core/colors_manager.dart';
import 'package:tonyyyyyy/core/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static const String routeName = "/splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RoutesManager.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blue,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(flex: 4, child: Image.asset('assets/Branding.png')),
        ],
      ),
    );
  }
}
