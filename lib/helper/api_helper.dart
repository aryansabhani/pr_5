import 'dart:convert';

import 'package:http/http.dart' as http;

class WallpaperApi {
  WallpaperApi._();

  static final WallpaperApi wallpaperApi = WallpaperApi._();

  getwallpapers({String q = "naruto",String orientation = "all"}) async {
    String wallapi =
        "https://pixabay.com/api/?key=25793561-986d691b40b58493c6de14df4&q=$q&orientation=$orientation";
    http.Response response = await http.get(Uri.parse(wallapi));


    if(response.statusCode == 200){
      var data = jsonDecode(response.body);

      List allData = data['hits'];
      print("data : ${data}");
      return allData;
    }
    else{
      print("error");
    }
  }
}
