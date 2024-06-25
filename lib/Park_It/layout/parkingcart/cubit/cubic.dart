import 'dart:async';
import 'package:f/Park_It/layout/parkingcart/cubit/states.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  static DataCubit get(context) => BlocProvider.of(context);

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();



  void startFetchingData() {
    emit(DataLoading());
    fetchSensorData();
  }

  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  Map<dynamic, dynamic>? SensorData;

  Stream<DataState> fetchSensorData() async* {
    emit(DataLoading());
    try {
      await for (var event in databaseReference.onValue) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;

      }
    } catch (error) {
      yield DataError('Failed to fetch data: $error');
    }
  }

}