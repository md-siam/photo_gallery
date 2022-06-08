import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/photo_model.dart';
import '../static/static_values.dart';

Future<List<PhotoModel>> getMultiplePhotoData() async {
  List<PhotoModel> resultList = [];
  try {
    Response response = await Dio().get(StaticValues.listOfRandom30PhotosUrl);

    //print('Response: ${response.data}');
    //print(response.statusCode);
    if (response.statusCode == 200) {
      resultList =
          (response.data as List).map((x) => PhotoModel.fromJson(x)).toList();

      //log('ResultList: ${resultList[1].id}');

    } else {
      print('Error!');
    }
  } catch (e) {
    log(e.toString());
    //print(e);
  }
  return resultList;
}
