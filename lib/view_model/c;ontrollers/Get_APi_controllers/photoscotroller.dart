import 'dart:convert';

import 'package:api_integration/resources/appurls/appurls.dart';
import 'package:get/get.dart';

import '../../../model/Get_APi_models/photosmodel.dart';
import 'package:http/http.dart' as http;

class Photoscontroller extends GetxController {
  var photosslist = <Photosmodel>[].obs;
  RxBool isloading = false.obs;

  Future<void> getphotos() async {
    isloading.value = true;
    try {
      final response = await http.get(Uri.parse(Appurls.photosurl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString()) as List;
        photosslist.clear(); // Clear existing data

        photosslist.addAll(
          data.map((item) => Photosmodel.fromJson(item)).toList(),
        );
        print(photosslist.length);
      } else {
        isloading = true.obs;
        print('Error: Failed to load photos');
      }
    } catch (e) {
      isloading = true.obs;
      print('Exception: $e');
    } finally {
      isloading.value = false; // Set loading to false after fetching is done
    }
  }
}
