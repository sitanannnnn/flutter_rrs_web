import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_web/model/readuser_model.dart';
import 'package:flutter_web/screen/Sidebar.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);
  static const String id = 'user-information';

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  List<ReaduserModel> readuserModels = [];
  @override
  @override
  void initState() {
    super.initState();
    readuser();
  }

  Future<Null> readuser() async {
    var url =
        'http://localhost/my_login_rrs/getCustomerFromchooseType.php?isAdd=true&chooseType=User';
    Response response = await Dio().get(url);
    //print('res = $response');

    var result = json.decode(response.data);
    print('result = $result');
    for (var map in result) {
      ReaduserModel readuserModel = ReaduserModel.fromJson(map);
      setState(() {
        readuserModels.add(readuserModel);
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
        sideBar: _sideBar.sideBarMenus(context, UserInformation.id),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ID'),
                  Text('User'),
                  Text('Name'),
                  Text('Phonenumber'),
                  Text('Email'),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: readuserModels.length,
                itemBuilder: (context, index) => Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 20,
                                  child:
                                      Text(readuserModels[index].customerId!)),
                              Container(
                                  width: 100,
                                  child: Text(readuserModels[index].user!)),
                              Container(
                                  width: 200,
                                  child: Text(readuserModels[index].name!)),
                              Container(
                                  width: 100,
                                  child:
                                      Text(readuserModels[index].phonenumber!)),
                              Container(
                                  width: 150,
                                  child: Text(readuserModels[index].email!)),
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
