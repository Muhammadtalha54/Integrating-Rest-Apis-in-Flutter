import 'dart:convert';

import 'package:api_integration/model/Get_APi_models/shopapimodel.dart';
import 'package:api_integration/resources/appurls/appurls.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class Shopcontroller extends GetxController {
  RxBool isloading = true.obs;
  var shopModel = Shopmodel().obs;

  Future<void> getproducts() async {
    try {
      final responce = await http.get(Uri.parse(Appurls.Shopapiurl));
      var data = jsonDecode(responce.body.toString());
      print(data);
      if (responce.statusCode == 200) {
        print('status ok data recieved successfully');
        final Map<String, dynamic> data = jsonDecode(responce.body);
        shopModel.value = Shopmodel.fromJson(data);
      } else {
        print('Not recieved the data uccessfully');
      }
    } catch (e) {
      print('$e this is the exception');
      isloading.value = true;
    } finally {
      print('ok boss');
      isloading.value = false;
    }
  }
}
