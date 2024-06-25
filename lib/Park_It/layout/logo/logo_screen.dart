import 'package:flutter/material.dart';
import 'package:f/Park_It/layout/onBoarding/onboarding.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});
  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Apply border radius
                color: Colors.red, // Optional: Set a background color
              ),
              width: 200,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                width: double.infinity,
                height: 200,
                color: Colors.white,
              ),
            ),
            //Icon(Icons.local_parking_outlined,size: 250,color: Colors.red,) ,
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Park-It",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
