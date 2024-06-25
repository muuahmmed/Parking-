
abstract class ParkingRegisterState{}
class Registerchange_eyee extends ParkingRegisterState {}

class ParkingRegisterInitialState extends ParkingRegisterState{}

class ParkingRegisterLoadState extends ParkingRegisterState{}

class ParkingRegisterSuccessState extends ParkingRegisterState {}

class ParkingRegisterErrorState extends ParkingRegisterState{
  final String error;
  ParkingRegisterErrorState(this.error);
}

class ParkingREgChangePasswordVisibilityState extends ParkingRegisterState{}
class ParkingCreateUserSuccessState extends ParkingRegisterState{}

class ParkingCreateUserLoadState extends ParkingRegisterState{}

class ParkingCreateUserErrorState extends ParkingRegisterState{
  final String error;
  ParkingCreateUserErrorState(this.error);
}

