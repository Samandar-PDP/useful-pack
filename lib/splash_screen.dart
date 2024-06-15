import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:useful_packages/settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/panda.png',width: 150,height: 150,),
            const SizedBox(height: 20),
           const Text("Panda",style: TextStyle(
              fontFamily: "Balo",
              fontSize: 25,
             color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}
