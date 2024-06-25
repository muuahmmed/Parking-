import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/constatnts/constants.dart';
import 'package:f/Park_It/layout/home/cubit/states.dart';
import 'package:f/Park_It/models/user_model/user_model.dart';

class ParkingCubit extends Cubit<ParkingStates>
{
  ParkingCubit(): super(ParkingInitialState());
  static ParkingCubit get(context) => BlocProvider.of(context);
  var feedBackController = TextEditingController();
  ParkingUserModel? userModel;
  void getUserData()
  {
    emit(ParkingGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get().then((value)
    {
      userModel = ParkingUserModel.fromJson(value.data()!);
      emit(ParkingGetUserSuccessState());
    }).catchError((error)
    {
      emit(ParkingGetUserErrorState(error.toString()));
    });
  }
  void makeFeedback()
  {
    emit(MakeUserFeedbackLoadingState());

    FirebaseFirestore.instance
        .collection('feedback')
        .add({
      "feedback":feedBackController.text,
      "userName":userModel!.userName,
    }).then((value)
    {
      emit(MakeUserFeedbackSuccessState());
    }).catchError((error)
    {
      emit(MakeUserFeedbackErrorState(error.toString()));
    });
  }
}