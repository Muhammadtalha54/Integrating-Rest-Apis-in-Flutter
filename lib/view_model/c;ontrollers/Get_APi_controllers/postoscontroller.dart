import 'dart:convert';

import 'package:api_integration/resources/appurls/appurls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/Get_APi_models/postsmodel.dart';
import 'package:http/http.dart' as http;

class Postcontroller extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Postsmodel> postslist = <Postsmodel>[].obs;
  Future<List<Postsmodel>> getposts() async {
    try {
      final response = await http.get(Uri.parse(Appurls.postsurl));
      var data = jsonDecode(response.body.toString());
      postslist.clear();

      if (response.statusCode == 200) {
        for (Map i in data) {
          postslist.add(Postsmodel.fromJson(i as Map<String, dynamic>));
        }
        return postslist;
      } else {
        print('error fetching the data');
        return postslist;
      }
    } catch (e) {
      print(e);
      return postslist;
    }
  }
}
