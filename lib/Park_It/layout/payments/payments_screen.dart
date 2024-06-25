import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatefulWidget {
  final TimeOfDay selectedTimeFrom;
  final TimeOfDay selectedTimeTo;

  const PaymentScreen({
    required Key? key,
    required this.selectedTimeFrom,
    required this.selectedTimeTo,
  }) : super(key: key);


  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference dbRef =
  FirebaseDatabase.instance.ref().child('CarExistance');

  late int _totalMinutes;
  late double _totalAmount;
  late Timer _timer;
  DateTime? _startTime;
  bool _isParkingActive = false;

  @override
  void initState() {
    super.initState();
    _calculateTotalAmount();
    _loadUserData();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isParkingActive) {
        setState(() {
          _updateParkingDuration();
        });
      }
    });
  }

  void _updateParkingDuration() {
    if (_startTime != null) {
      final now = DateTime.now();
      final difference = now.difference(_startTime!);
      _totalMinutes = difference.inMinutes;
      _totalAmount = _totalMinutes * 1.0; // Charge $1 per minute
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Here you can pay for your parking slot',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 50),
            const Divider(color: Colors.white),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isParkingActive
                        ? 'Time Spent: ${_formatTimeFromMinutes(_totalMinutes)}'
                        : 'Selected Time: ${_formatTime(widget.selectedTimeFrom)} - ${_formatTime(widget.selectedTimeTo)}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Total Minutes: $_totalMinutes',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Total Amount: \$${_totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _startPayPalPayment();
                },
                child: const Text(
                  'Complete Payment',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _endParkingTime();
                },
                child: const Text(
                  'End Parking Time',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _applyForPayPalCredit();
                },
                child: const Text(
                  'Apply for PayPal Credit',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateTotalAmount() {
    final startTime = DateTime(
        0, 0, 0, widget.selectedTimeFrom.hour, widget.selectedTimeFrom.minute);
    final endTime = DateTime(
        0, 0, 0, widget.selectedTimeTo.hour, widget.selectedTimeTo.minute);
    final difference = endTime.difference(startTime);
    _totalMinutes = difference.inMinutes;
    _totalAmount = _totalMinutes * 0.1; // Charge $1 per minute
  }

  void _startPayPalPayment() {
    if (_totalAmount <= 0) {
      return; // No payment if total amount is zero or negative
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true, // Set to true for testing with sandbox credentials
          clientId: "YOUR_CLIENT_ID", // Replace with your PayPal client ID
          secretKey: "YOUR_SECRET_KEY", // Replace with your PayPal secret key
          transactions: [
            {
              "amount": {
                "total": _totalAmount
                    .toStringAsFixed(2), // Total amount based on selected time
                "currency": "USD",
              },
              "description":
              "Payment for parking slot", // Transaction description
              "item_list": {
                "items": [
                  {
                    "name": "Parking Slot",
                    "quantity": "1",
                    "price": _totalAmount
                        .toStringAsFixed(2), // Price based on selected time
                    "currency": "USD",
                  },
                ],
              },
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map<String, dynamic> params) async {
            await _savePaymentDetails(params);
            Navigator.pop(context); // Pop the payment screen
          },
          onError: (error) {
            print("Payment error: $error");
            Navigator.pop(context); // Pop the payment screen
          },
          onCancel: () {
            print('Payment cancelled');
            Navigator.pop(context); // Pop the payment screen
          },
        ),
      ),
    );
  }

  Future<void> _savePaymentDetails(Map<String, dynamic> paymentInfo) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final DocumentReference paymentRef =
        _firestore.collection('payments').doc();
        await paymentRef.set({
          'userId': user.uid,
          'userName': user.displayName,
          'paymentId': paymentRef.id,
          'amount': paymentInfo['amount']['total'],
          'currency': paymentInfo['amount']['currency'],
          'timestamp': FieldValue.serverTimestamp(),
        });
        print('Payment details saved to Firestore.');
      } else {
        print('User not authenticated.');
      }
    } catch (e) {
      print('Error saving payment details: $e');
    }
  }

  Future<void> _endParkingTime() async {
    try {
      await dbRef.set(0); // Update CarExistance value to 0
      setState(() {
        _isParkingActive = false;
        _totalMinutes = 0;
        _totalAmount = 0.0;
        _startTime = null;
      });
      print('Parking time ended and CarExistance updated.');
    } catch (e) {
      print('Error ending parking time: $e');
    }
  }

  Future<void> _applyForPayPalCredit() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      try {
        final DocumentReference userRef = _firestore.collection('users').doc(user.uid);
        await userRef.set({
          'userId': user.uid,
          'userName': user.displayName,
          'email': user.email,
          'paypalCreditApplied': true,
          'timestamp': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true)); // Merge the data to avoid overwriting existing data
        print('User data saved to Firestore.');

        const url = 'https://www.paypal.com/us/webapps/mpp/paypal-credit'; // PayPal Credit application URL
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      } catch (e) {
        print('Error saving user data: $e');
      }
    } else {
      print('User not authenticated.');
    }
  }

  Future<void> _loadUserData() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      try {
        final DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          final data = userDoc.data() as Map<String, dynamic>;
          setState(() {
            _isParkingActive = data['parkingActive'] ?? false;
            _startTime = data['startTime'] != null
                ? (data['startTime'] as Timestamp).toDate()
                : null;
          });
          print('User data loaded: $data');
        } else {
          print('User data not found.');
        }
      } catch (e) {
        print('Error loading user data: $e');
      }
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
    DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.Hm().format(dateTime);
  }

  String _formatTimeFromMinutes(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return '${hours.toString().padLeft(2, '0')}:${mins.toString().padLeft(2, '0')}';
  }
}
