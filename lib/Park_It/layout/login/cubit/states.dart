
abstract class ParkingLoginStates{}

class ParkingLoginInitialStates extends ParkingLoginStates{}

class ParkingLoginLoadStates extends ParkingLoginStates{}

class ParkingLoginSuccessStates extends ParkingLoginStates
{
  final String uId;
  ParkingLoginSuccessStates(this.uId);
}

class ParkingLoginErrorStates extends ParkingLoginStates
{
  final String error;
  ParkingLoginErrorStates(this.error);
}
class LoginChangePasswordEye extends ParkingLoginStates {}


class LoginChangeRememberMe extends ParkingLoginStates {}




