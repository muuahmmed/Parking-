import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DataScreen extends StatefulWidget {
  final String slotLabel;

  const DataScreen({required this.slotLabel, Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  String? _userName;

  final _firestore = FirebaseFirestore.instance;

  Future<void> _selectDate(BuildContext context, bool isFirst) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFirst) {
          _selectedStartDate = picked;
        } else {
          _selectedEndDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _selectedStartTime = picked;
        } else {
          _selectedEndTime = picked;
        }
      });
    }
  }

  void saveReservation(BuildContext context) async {
    if (_selectedStartDate != null &&
        _selectedEndDate != null &&
        _selectedStartTime != null &&
        _selectedEndTime != null &&
        _userName != null) {
      final startTime = DateTime(
        _selectedStartDate!.year,
        _selectedStartDate!.month,
        _selectedStartDate!.day,
        _selectedStartTime!.hour,
        _selectedStartTime!.minute,
      );

      final endTime = DateTime(
        _selectedEndDate!.year,
        _selectedEndDate!.month,
        _selectedEndDate!.day,
        _selectedEndTime!.hour,
        _selectedEndTime!.minute,
      );

      // Store reservation in Firestore
      await _firestore.collection('reservations').add({
        'userName': _userName,
        'slotLabel': widget.slotLabel,
        'startTime': startTime,
        'endTime': endTime,
      });

      // Update slot status in Realtime Database
      await FirebaseDatabase.instance.ref().child('CarExistance').set(1);

      // Pass selected times back to Home screen
      Navigator.of(context).pop({
        'startTime': startTime,
        'endTime': endTime,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both dates and times')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: const Text('Select Reservation Time', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context, true),
              child: const Text('Select Start Date'),
            ),
            if (_selectedStartDate != null) ...[
              Text('Start Date: ${DateFormat('yyyy-MM-dd').format(_selectedStartDate!)}'),
              ElevatedButton(
                onPressed: () => _selectTime(context, true),
                child: const Text('Select Start Time'),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context, false),
              child: const Text('Select End Date'),
            ),
            if (_selectedEndDate != null) ...[
              Text('End Date: ${DateFormat('yyyy-MM-dd').format(_selectedEndDate!)}'),
              ElevatedButton(
                onPressed: () => _selectTime(context, false),
                child: const Text('Select End Time'),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final userName = await showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Enter Your Name'),
                    content: TextField(
                      onChanged: (value) => _userName = value,
                      decoration: const InputDecoration(hintText: 'Enter your name'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_userName != null && _userName!.isNotEmpty) {
                            Navigator.of(context).pop(_userName);
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                );
                if (userName != null) {
                  setState(() {
                    _userName = userName;
                  });
                  saveReservation(context);
                }
              },
              child: const Text('Reserve Slot'),
            ),
          ],
        ),
      ),
    );
  }
}

