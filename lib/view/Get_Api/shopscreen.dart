import 'dart:ui';

import 'package:api_integration/model/Get_APi_models/shopapimodel.dart';
import 'package:api_integration/view_model/c;ontrollers/Get_APi_controllers/shopcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Shopscreen extends StatefulWidget {
  const Shopscreen({super.key});

  @override
  State<Shopscreen> createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen> {
  var height, width;
  final shopController = Get.put(Shopcontroller());
  @override
  void initState() {
    // TODO: implement initState
    shopController.getproducts();
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: Obx(() {
        if (shopController.isloading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (shopController.shopModel.value.data == null ||
            shopController.shopModel.value.data!.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: shopController.shopModel.value.data!.length,
            itemBuilder: (context, index) {
              var product = shopController.shopModel.value.data![index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 15,
                  color: Colors.black,
                  child: Container(
                    height: height * 0.6,
                    width: width,
                    color: Color.fromARGB(101, 158, 158, 158),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.45,
                          width: width,
                          decoration: BoxDecoration(),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.images!.length,
                            itemBuilder: (context, index) {
                              var image = product.images![index].url;
                              print(image);
                              return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: // Expanded(
                                      Container(
                                    height: height,
                                    width: width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(image!))),
                                  )
                                  //),
                                  );
                            },
                          ),
                        ),
                        Container(
                            height: height * 0.05,
                            width: width,
                            color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: width * 0.2,
                                ),
                                Container(
                                  width: width * 0.2,
                                  child: Text(
                                      " Rs.${product.price.toString()} ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    color: (product.onSale == true)
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                  child: (product.onSale == true)
                                      ? Center(
                                          child: Text(
                                            "${product.salePercent.toString() ?? 0} %",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            "Not on sale",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                ),
                              ],
                            )),
                        Center(
                          child: Text(product.shop!.description.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Center(
                          child: Text(
                            product.shop!.shopaddress.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    // Access other nested objects/lists here based on your model structure
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
//  Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: ListView.builder(
//         itemCount:shopController.shopModel.value!.length
//         itemBuilder: (context, index) {
//           var product = shopController.shopModel.value.data![index];
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product['title'],
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text('Price: \$${product['price']}'),
//                   Text('Sale Price: \$${product['sale_price']}'),
//                   SizedBox(height: 5),
//                   _buildCategories(product['categories']),
//                   SizedBox(height: 5),
//                   _buildSubCategory(product['subcat']),
//                   SizedBox(height: 5),
//                   _buildShopInfo(product['shop']),
//                   SizedBox(height: 5),
//                   _buildImageList(product['images']),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildCategories(Map<String, dynamic> category) {
//     return Row(
//       children: [
//         Text(
//           'Category: ${category['name']}',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         SizedBox(width: 10),
//         Image.network(
//           category['image'],
//           width: 50,
//           height: 50,
//         ),
//       ],
//     );
//   }

//   Widget _buildSubCategory(Map<String, dynamic> subcat) {
//     return Text(
//       'Subcategory: ${subcat['name']}',
//       style: TextStyle(fontWeight: FontWeight.bold),
//     );
//   }

//   Widget _buildShopInfo(Map<String, dynamic> shop) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Shop: ${shop['name']}'),
//         Text('Shop City: ${shop['shopcity']}'),
//         Image.network(shop['image'], width: 100, height: 100),
//       ],
//     );
//   }

//   Widget _buildImageList(List<dynamic> images) {
//     return Container(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: images.length,
//         itemBuilder: (context, imgIndex) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: Image.network(
//               images[imgIndex]['url'],
//               width: 100,
//               height: 100,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

}
