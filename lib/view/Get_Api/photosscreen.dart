import 'package:api_integration/view_model/c;ontrollers/Get_APi_controllers/photoscotroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Photosscreen extends StatefulWidget {
  const Photosscreen({super.key});

  @override
  State<Photosscreen> createState() => _PhotosscreenState();
}

class _PhotosscreenState extends State<Photosscreen> {
  final photoscontroller = Get.put(Photoscontroller());
  var height, width;
  @override
  void initState() {
    // TODO: implement initState
    photoscontroller.getphotos();
    super.initState();
  }

  void dispose() {
    Get.delete<Photoscontroller>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Pictures// photos api'),
      ),
      body: Obx(() {
        if (photoscontroller.isloading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: photoscontroller.photosslist.length,
            itemBuilder: (context, index) {
              final imageUrl = photoscontroller.photosslist[index].thumbnailUrl;
              print(imageUrl);
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    color: Color.fromARGB(255, 40, 40, 40),
                    child: Container(
                      height: height * 0.25,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.06,
                            width: width,
                            child: Text(
                              photoscontroller.photosslist[index].id.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: height * 0.06,
                            width: width,
                            child: Text(
                              photoscontroller.photosslist[index].title!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: height!,
                              width: width!,
                              child: Image.network(
                                photoscontroller
                                    .photosslist[index].thumbnailUrl!,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons
                                      .error); // or any widget you'd like as a fallback
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
        }
      }),
    );
  }
}
