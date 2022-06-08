import 'package:flutter/material.dart';

import '../models/photo_model.dart';
import '../services/get_multiple_photo_data.dart';

class MultiPhotoProvider extends ChangeNotifier {
  List<PhotoModel>? photoList;
  bool isLoading = false;

  getPhotoData() async {
    isLoading = true;
    photoList = await getMultiplePhotoData();
    print('Provider: ${photoList?.length}');
    isLoading = false;

    notifyListeners();
  }

  // this is for pagination
  getMorePhotoData() async {
    isLoading = true;
    List<PhotoModel>? morePhotoList = await getMultiplePhotoData();
    photoList!.addAll(morePhotoList);
    print('Provider: ${photoList?.length}');
    isLoading = false;

    notifyListeners();
  }
}
