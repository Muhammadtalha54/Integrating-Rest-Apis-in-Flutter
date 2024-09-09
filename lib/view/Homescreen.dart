import 'package:api_integration/resources/compoents/button.dart';
import 'package:api_integration/view/Get_Api/Usersscreen.dart';
import 'package:api_integration/view/Get_Api/photosscreen.dart';
import 'package:api_integration/view/Get_Api/posts.dart';
import 'package:api_integration/view/Get_Api/shopscreen.dart';
import 'package:api_integration/view_model/c;ontrollers/Get_APi_controllers/photoscotroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Color.fromARGB(255, 126, 12, 6),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Get APi",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.15,
              width: width,
              color: Color.fromARGB(255, 226, 225, 224),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Mybuttton(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Shopscreen(),
                            ));
                      },
                      name: 'Products '),
                  Mybuttton(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Postsscreen(),
                            ));
                      },
                      name: 'posts'),
                  Mybuttton(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Photosscreen()));
                      },
                      name: 'photos'),
                  Mybuttton(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Usersscreen()));
                      },
                      name: 'Users')
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              "Post APi",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.15,
              width: width,
              color: Color.fromARGB(255, 226, 225, 224),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Mybuttton(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Postsscreen(),
                            ));
                      },
                      name: 'posts'),
                  Mybuttton(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Photosscreen()));
                      },
                      name: 'photos'),
                  Mybuttton(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Usersscreen()));
                      },
                      name: 'Users')
                ],
              ),
            )
          ],
        ));
  }
}
