import 'package:f/Park_It/components/components.dart';
import 'package:f/Park_It/layout/home/home_screen.dart';
import 'package:flutter/material.dart';
class LocationAreaScreen extends StatefulWidget {
  const LocationAreaScreen({super.key});
  @override
  State<LocationAreaScreen> createState() => _LocationAreaScreenState();
}
class _LocationAreaScreenState extends State<LocationAreaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Areas'),
        leading: IconButton(onPressed: (){
          navigateAndFinish(context, const Home());
        },icon: const Icon(Icons.arrow_back),color: Colors.white,),
      ),
      body: const Center(
        child: Text('FUTURE RELEASE',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
      ),
    );
  }
}


