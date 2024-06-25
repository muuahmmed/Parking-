import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/layout/login/cubit/states.dart';

class ParkingLoginCubit extends Cubit<ParkingLoginStates>
{
  ParkingLoginCubit():super(ParkingLoginInitialStates());
  static ParkingLoginCubit get(context)=>BlocProvider.of(context);
  var obscuretext = false;

  void userLogin(
      {
        required String email,
        required String password,
      })
  {
    emit(ParkingLoginLoadStates());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
      emit(ParkingLoginSuccessStates(value.user!.uid));
    }).catchError((error){
      emit(ParkingLoginErrorStates(error.toString()));
    });
  }

}