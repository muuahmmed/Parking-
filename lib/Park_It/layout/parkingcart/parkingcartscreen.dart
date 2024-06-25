import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../parking date/parking date screen.dart'; // Import the PaymentScreen

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late DatabaseReference dbRef;
  bool isReserved = false;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('CarExistance');
    fetchCarSlotStatus();
  }

  void fetchCarSlotStatus() {
    dbRef.onValue.listen((event) {
      final data = event.snapshot.value as int?;
      if (data != null) {
        setState(() {
          isReserved = data == 1;
        });
      }
    });
  }

  void navigateToDataScreen(BuildContext context, String slotLabel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DataScreen(slotLabel: slotLabel),
      ),
    ).then((_) {
      fetchCarSlotStatus(); // Refresh status when returning from DataScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Parking Cart',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: buildButton(
          context,
          Icons.directions_car_filled_outlined,
          "slot 1",
          isReserved,
              () => navigateToDataScreen(context, "slot 1"),
        ),
      ),
    );
  }
}

Widget buildButton(BuildContext context, IconData icon, String label, bool isReserved, VoidCallback onPressed) {
  return SizedBox(
    width: 150,
    height: 150,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 12,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 3, style: BorderStyle.solid),
        ),
        backgroundColor: isReserved ? Colors.red : Colors.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 85,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            isReserved ? 'Reserved' : 'Available',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
