import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/Get_APi_models/postsmodel.dart';
import '../../view_model/c;ontrollers/Get_APi_controllers/postoscontroller.dart';

class Postsscreen extends StatefulWidget {
  const Postsscreen({super.key});

  @override
  State<Postsscreen> createState() => _PostsscreenState();
}

class _PostsscreenState extends State<Postsscreen> {
  List<Postsmodel> postslist = [];
  final postscontroller = Get.put(Postcontroller());

  @override
  void initState() {
    postscontroller.getposts();
    super.initState();
  }
   void dispose() {
    Get.delete<Postcontroller>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Obx(() {
        return ListView.builder(
          itemCount: postscontroller.postslist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Color.fromARGB(255, 40, 40, 40),
                child: ListTile(
                  leading: Text(
                    postscontroller.postslist[index].id.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  title: Text(
                    postscontroller.postslist[index].title!,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    postscontroller.postslist[index].body!,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
