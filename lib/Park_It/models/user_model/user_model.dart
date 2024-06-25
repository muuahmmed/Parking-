class ParkingUserModel
{
  String? uId;
  String ?email;
  String ?userName;
  String ?phone;

  bool? isEmailVerified;

  ParkingUserModel(
      {
       required this.email,
        required this.uId,
        required this.isEmailVerified,
        required this.phone,
        required this.userName,

      });

  ParkingUserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    userName = json['userName'];
    phone = json['phone'];

  }
  Map<String, dynamic> toMap()
  {
    return{
      'email':email,
      'uId':uId,
      'isEmailVerified':isEmailVerified,
      'userName':userName,
      'phone':phone,

    };
  }
}
