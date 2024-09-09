import 'dart:convert';

import 'package:api_integration/model/Get_APi_models/Usersmodel.dart';
import 'package:api_integration/resources/appurls/appurls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/Get_APi_models/postsmodel.dart';
import 'package:http/http.dart' as http;

// there is some problem with this api so we can check on another one
class Userscontroller extends GetxController {
  RxBool isloading = false.obs;
  List<Usersmodel> userslist = [];

  Future<List<Usersmodel>> getUsers() async {
    isloading.value = true;

    try {
      final response = await http.get(Uri.parse(Appurls.useraurl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        //  print('Raw JSON data: $data'); // Print raw JSON data

        userslist.clear();

        for (var item in data) {
          Usersmodel user = Usersmodel.fromJson(item);
          // print(
          //     'Parsed User: ${user.name}, ${user.username}, ${user.email}'); // Print each user's details
          userslist.add(user);
        }

        return userslist;
      } else {
        isloading = true.obs;
        print(
            'Error: Failed to load photos with status code ${response.statusCode}');
        return [];
      }
    } catch (e) {
      isloading = true.obs;
      print('Exception: $e');
      return [];
    } finally {
      isloading.value = false; // Stop loading
      return userslist;
    }
  }
}
