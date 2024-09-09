import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/Get_APi_models/Usersmodel.dart';
import '../../resources/compoents/userscomponent.dart';
import '../../view_model/c;ontrollers/Get_APi_controllers/Userscontroller.dart';

class Usersscreen extends StatefulWidget {
  const Usersscreen({super.key});

  @override
  State<Usersscreen> createState() => _UsersscreenState();
}

class _UsersscreenState extends State<Usersscreen> {
  final Userscontroller userscontroller = Get.put(Userscontroller());

  @override
  void initState() {
    super.initState();
    userscontroller.getUsers();
  }

  @override
  void dispose() {
    Get.delete<Userscontroller>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Users Api'),
      ),
      body: Obx(() {
        if (userscontroller.isloading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          // return Text(
          //   userscontroller.userslist.length.toString(),
          //   style: TextStyle(color: Colors.white),
          // );
          return ListView.builder(
            itemCount: userscontroller.userslist.length,
            itemBuilder: (context, index) {
              final user = userscontroller.userslist[index];
              // print('user$user');
              return UserCard(user: user);
            },
          );
        }
      }),
    );
  }
}
