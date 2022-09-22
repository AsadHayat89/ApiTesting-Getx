import 'package:api_testing/Controller/Product_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/Home_Controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var UserData = Get.put(ProductController());
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),

          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
          Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "Cosmatics",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10, right: 30),
                      child: Icon(
                        Icons.home,
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, right: 30),
                      child: Icon(
                        Icons.list,
                      )),
                ],
              ),

            ],
          ),
        ),
        Expanded(
          child:
          Obx(
                  () =>
              UserData.Loading.value == false ?
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: EdgeInsets.all(10),
                children: List.generate(UserData.user.length,
                      (index) =>
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Container(
                          width: double.infinity,
                          height: 120,
                          child: Image.network(UserData.user[index].imageLink!,
                              fit: BoxFit.contain,  errorBuilder: (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                              return Center(child: Text('Loading Failed...'));
                            },
                        ),

                      ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(UserData.user[index].name!,
                      style: TextStyle(fontSize: 16),),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10,top: 5),
                  //   child: Text(UserData.user[index].price!,style: TextStyle(fontSize: 12),),
                  // ),
                  ],
                ),
              )),
        ):Text("Loading..."),)
    )
    ]
    ,
    )
    ,
    );
  }
}
