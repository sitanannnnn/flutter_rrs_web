import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_web/model/readrestaurant_model.dart';
import 'package:flutter_web/screen/Sidebar.dart';

import 'package:flutter_web/utillity/normal_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckRestaurant extends StatefulWidget {
  const CheckRestaurant({Key? key}) : super(key: key);
  static const String id = 'check-restaurant';

  @override
  _CheckRestaurantState createState() => _CheckRestaurantState();
}

class _CheckRestaurantState extends State<CheckRestaurant> {
  List<ReadrestaurantModel> readrestaurantModels = [];
  String? Shop, restaurantId;
  bool? loadstatus = true;

  @override
  void initState() {
    super.initState();
    print(' nn=>$Shop');
    readRestaurantpendingReview().then((value) => loadstatus = false);
  }

  Future<Null> readRestaurantpendingReview() async {
    Shop = ('shop');
    print('shop=>$Shop');
    var url =
        'http://localhost/my_login_rrs/getRestaurantFromchooseTypeAndpendingReview.php?isAdd=true&chooseType=&shop';
    Response response = await Dio().get(url);
    //print('res = $response');

    var result = json.decode(response.data);
    print('result = $result');
    for (var map in result) {
      ReadrestaurantModel readrestaurantModel =
          ReadrestaurantModel.fromJson(map);
      setState(() {
        loadstatus = true;
        readrestaurantModels.add(readrestaurantModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();

    return AdminScaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.black87,
        //   iconTheme: IconThemeData(color: Colors.white),
        // ),
        sideBar: _sideBar.sideBarMenus(context, CheckRestaurant.id),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ID'),
                  Text('Name'),
                  Text('Email'),
                  Text('Phonenumber'),
                  Text('ID number'),
                  Text('Name shop'),
                  Text('Branch'),
                  Text('Address'),
                  Text('Type of food'),
                  Text('Verify'),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: readrestaurantModels.length,
                itemBuilder: (context, index) => Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: 50,
                                  child: Text(readrestaurantModels[index]
                                      .restaurantId!)),
                              Container(
                                  width: 100,
                                  child:
                                      Text(readrestaurantModels[index].name!)),
                              Container(
                                  width: 80,
                                  child:
                                      Text(readrestaurantModels[index].email!)),
                              Container(
                                  width: 100,
                                  child: Text(readrestaurantModels[index]
                                      .phonenumber!)),
                              Container(
                                  child: Text(readrestaurantModels[index]
                                      .restaurantIdNumber!)),
                              Container(
                                  child: Text(readrestaurantModels[index]
                                      .restaurantNameshop!)),
                              Container(
                                  child: Row(
                                children: [
                                  readrestaurantModels[index]
                                              .restaurantBranch ==
                                          "null"
                                      ? Text("-")
                                      : Text(readrestaurantModels[index]
                                          .restaurantBranch!),
                                ],
                              )),
                              Container(
                                  width: 150,
                                  child: Text(readrestaurantModels[index]
                                      .restaurantAddress!)),
                              Container(
                                  width: 100,
                                  child: Text(
                                      readrestaurantModels[index].typeOfFood!)),
                              Container(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          restaurantId =
                                              readrestaurantModels[index]
                                                  .restaurantId;
                                          print(
                                              "you click approve =>>>>$restaurantId");
                                          approve();
                                        },
                                        icon: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          restaurantId =
                                              readrestaurantModels[index]
                                                  .restaurantId;
                                          print(
                                              "you click unapprove =>>>>$restaurantId");
                                          unapprove();
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          )
                        ],
                      ),
                    )),
          ],
        )
            // Container(
            //   alignment: Alignment.topLeft,
            //   padding: const EdgeInsets.all(10),
            //   child: Column(
            //     children: [

            //     ],
            //   ),
            // ),
            ));
  }

  Future<Null> approve() async {
    Shop = ('shop');
    print('shop=>$Shop');
    var url =
        'http://localhost/my_login_rrs/editRestaurantWhereApprove.php?isAdd=true&restaurantId=$restaurantId';
    await Dio().get(url).then((value) {
      print('value =$value');
      // if (value.toString() == 'true') {
      //   print("approve");
      // } else {
      //   normalDialog(context, 'failed try again');
      // }
    });
  }

  Future<Null> unapprove() async {
    Shop = ('shop');
    print('shop=>$Shop');
    var url =
        'http://localhost/my_login_rrs/editRestaurantWhereUnapprove.php?isAdd=true&restaurantId=$restaurantId';
    await Dio().get(url).then((value) {
      print('value =$value');
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Signup complect',
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.red[100],
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        normalDialog(context, 'failed try again');
      }
    });
  }
}
