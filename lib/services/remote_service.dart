import 'dart:convert';

import 'package:api_testing/Model/Product.dart';
import 'package:http/http.dart' as http;
import 'package:api_testing/Model/User.dart';

class RemoteService {
  static var client=http.Client();
  static Future<List<User>> fetchproduct(String Url) async {

      var url = Uri.parse(Url);
      var newrequest = http.MultipartRequest(
        "Get",
        url,
      );
      var responce =await client.get(url);
      if(responce.statusCode==200){
        var jsonString=responce.body;
        return UserFromJson(jsonString);
      }
      else{
          return [];
      }

  }
  static Future<List<Product>?> fetchNEwproduct(String Url) async {

    var url = Uri.parse(Url);
    var newrequest = http.MultipartRequest(
      "Get",
      url,
    );
    var responce =await client.get(url);
    if(responce.statusCode==200){
      //
      List rawList = jsonDecode(responce.body);
      return rawList.map((json) => Product.fromJson(json)).toList();
     // return Product.fromJson(jsonDecode(jsonString));
    }
    else{
      return [];
    }

  }
}
