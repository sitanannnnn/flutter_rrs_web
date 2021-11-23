import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_web/model/readrestaurant_model.dart';
import 'package:flutter_web/screen/Sidebar.dart';

class RestaurantInformation extends StatefulWidget {
  const RestaurantInformation({Key? key}) : super(key: key);
  static const String id = 'restaurant-information';

  @override
  _RestaurantInformationState createState() => _RestaurantInformationState();
}

class _RestaurantInformationState extends State<RestaurantInformation> {
  List<ReadrestaurantModel> readrestaurantModels = [];
  @override
  @override
  void initState() {
    super.initState();
    readRestaurantAll();
  }

  Future<Null> readRestaurantAll() async {
    var url =
        'http://localhost/my_login_rrs/getRestaurantFromchooseTypeAll.php?isAdd=true&chooseType=Shop';
    Response response = await Dio().get(url);
    //print('res = $response');

    var result = json.decode(response.data);
    print('result = $result');
    for (var map in result) {
      ReadrestaurantModel readrestaurantModel =
          ReadrestaurantModel.fromJson(map);
      setState(() {
        readrestaurantModels.add(readrestaurantModel);
      });
    }
  }

  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.black87,
        //   iconTheme: IconThemeData(color: Colors.white),
        // ),
        sideBar: _sideBar.sideBarMenus(context, RestaurantInformation.id),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(readrestaurantModels[index].restaurantId!),
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
                                  child: Text(
                                      readrestaurantModels[index].verify!)),
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
}
