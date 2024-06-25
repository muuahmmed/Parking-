import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../register/register screen.dart';

class Second_Screen extends StatefulWidget{
  const Second_Screen({super.key});
  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), // Apply border radius
                  color: Colors.red, // Optional: Set a background color
                ),

                width: 200,
                child: const Image(image:
                AssetImage(
                    'assets/images/logo.png'
                ),width: double.infinity,height: 200,color: Colors.white,
                ),
              ),
             // const  Icon(Icons.drive_eta_outlined,size: 150,color: Colors.red,),
              const SizedBox(height: 20,),
              const Text("Park-It",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
              const SizedBox(height: 30,),

              SizedBox(
                width: 250.0,
                height: 50,
                child: MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
                },
                  color: Colors.red,
                  child: const Text(
                    'LOGIN', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  ),

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 250.0,
                height: 50,
                child: MaterialButton(
                  color: Colors.white,
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                },
                  child: const Text(
                    'REGISTER', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0d2331),
                    fontSize: 18,

                  ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
