import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:user_auth/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "USER Auth",
          style: TextStyle(
              fontSize: 40,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
