abstract class DataState{}

class DataInitial extends DataState{}

class DataLoading extends DataState{}

class ParkingSlotsSuccessStates extends DataState{
  final String uId;
  ParkingSlotsSuccessStates(this.uId);
}

class DataError extends DataState
{
  final String error;
  DataError(this.error);
}





