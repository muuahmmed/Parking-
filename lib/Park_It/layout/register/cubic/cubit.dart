import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/layout/register/cubic/states.dart';
import 'package:f/Park_It/models/register_model/register.dart';
import 'package:f/Park_It/models/user_model/user_model.dart';

class ParkingRegisterCubit extends Cubit<ParkingRegisterState> {
  ParkingRegisterCubit() : super(ParkingRegisterInitialState());

  static ParkingRegisterCubit get(context) => BlocProvider.of(context);
  ParkingRegisterModel? registerModel;
  var obscuretext = false;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String number,
  }) {
    emit(ParkingRegisterLoadState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {

      emit(ParkingRegisterSuccessState());
      userCreate(
        uId: value.user!.uid,
        email: email,
        name: name,
        phone: number,
      );
    }).catchError((error) {
      emit(ParkingRegisterErrorState(error.toString()));
    });
  }

  ////////////////////////////////////////////////////////////////////////////
  void userCreate({
    required String phone,
    required String name,
    required String email,
    required String uId,
  }) {
    emit(ParkingCreateUserLoadState());
    ParkingUserModel model = ParkingUserModel(uId: uId, email: email, isEmailVerified: false,phone: phone,userName: name,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(ParkingCreateUserSuccessState());
    }).catchError((error) {
      emit(ParkingCreateUserErrorState(error.toString()));
    });
  }
}
