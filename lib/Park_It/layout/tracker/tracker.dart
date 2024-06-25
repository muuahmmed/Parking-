import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Ensure you have Firebase Auth imported

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  final CollectionReference reservations = FirebaseFirestore.instance.collection('reservations');
  final FirebaseAuth _auth = FirebaseAuth.instance; // Add FirebaseAuth instance

  String? parkedLocation; // State to store the parked location
  String? parkedSlot; // State to store the parked slot

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Tracker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color(0xff0d2331),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/wifi.png"),
              height: 250,
              width: double.infinity,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(200, 47),
                ),
                onPressed: () {
                  fetchReservation();
                },
                child: const Text(
                  'TRACKER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (parkedSlot != null) // Show parked slot if available
              Text(
                'Parked Slot: $parkedSlot',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            if (parkedLocation != null) // Show parked location if available
              Text(
                'Parked Location: $parkedLocation',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchReservation() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        print('Fetching reservation for user: ${user.uid}');
        QuerySnapshot querySnapshot = await reservations.where('userId', isEqualTo: user.uid).get();
        if (querySnapshot.docs.isNotEmpty) {
          var reservation = querySnapshot.docs.first;
          print('Reservation found: ${reservation.data()}');
          setState(() {
            parkedSlot = reservation['slotLabel'];
            parkedLocation = reservation['location'];
          });
        } else {
          print('No reservation found for user: ${user.uid}');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No reservation found')),
          );
        }
      } else {
        print('User not authenticated');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not authenticated')),
        );
      }
    } catch (e) {
      print('Error fetching reservation: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch reservation')),
      );
    }
  }
}
