import 'package:flutter/material.dart';
import 'package:pr_5/helper/api_helper.dart';

class ApiProvider extends ChangeNotifier {
  List data = [];

  ApiProvider() {
    searchData();
  }

  searchData({String q = "naruto"}) async {
    data = await WallpaperApi.wallpaperApi.getwallpapers(q: q);
    print("$data");
    notifyListeners();
  }

  int? groupValue;

  setorientation({required int val}) {
    groupValue = val;
    if (groupValue == 0) {
      data = WallpaperApi.wallpaperApi.getwallpapers(orientation: "horizontal");
      notifyListeners();
    } else if (groupValue == 1) {
      data = WallpaperApi.wallpaperApi.getwallpapers(orientation: "vertical");
      notifyListeners();
    } else if (groupValue == 2) {
      data = WallpaperApi.wallpaperApi.getwallpapers(orientation: "all");
      notifyListeners();
    }
  }
}
