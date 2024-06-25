class HomeModel
{
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic>json)
  {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }

}

class HomeDataModel
{
  HomeDataModel.fromJson(Map<String, dynamic>json);
}


