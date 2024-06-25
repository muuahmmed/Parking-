abstract class ParkingStates{}

class ParkingInitialState extends ParkingStates{}

class ParkingGetUserLoadingState extends ParkingStates{}

class ParkingGetUserSuccessState extends ParkingStates{}

class ParkingGetUserErrorState extends ParkingStates
{
  final String error;

  ParkingGetUserErrorState(this.error);
}

class MakeUserFeedbackLoadingState extends ParkingStates{}

class MakeUserFeedbackSuccessState extends ParkingStates{}

class MakeUserFeedbackErrorState extends ParkingStates
{
  final String error;

  MakeUserFeedbackErrorState(this.error);
}
