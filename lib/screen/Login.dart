import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/model/admin_model.dart';
import 'package:flutter_web/model/readrestaurant_model.dart';
import 'package:flutter_web/screen/check_restaurant.dart';
import 'package:flutter_web/utillity/normal_dialog.dart';

class Login extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? user, password;

  @override
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF336699), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment(0.0, 0.0),
              stops: [1.0, 1.0])),
      child: Center(
        child: Container(
          width: 300,
          height: 420,
          child: Card(
            elevation: 6,
            shape: Border.all(color: Colors.blue, width: 2),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/admin.png',
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Admin CDG',
                            style: TextStyle(
                                fontSize: 35, color: Color(0xFF336699)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onChanged: (value) => user = value.trim(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter User Name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_sharp),
                                labelText: 'User Name',
                                focusColor: Theme.of(context).primaryColor,
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (value) => password = value.trim(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              }
                              if (value.length < 8) {
                                return "Minimum 8 characters";
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_rounded),
                                labelText: 'Password',
                                focusColor: Theme.of(context).primaryColor,
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2))),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('validated');
                                    print('user =$user');
                                    print('password =$password');
                                    checkAuthen();
                                  }
                                },
                                child: Text('Login'))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

//function check type user
  Future<Null> checkAuthen() async {
    var url =
        'http://localhost/my_login_rrs/getUserAdmin.php?isAdd=true&user=$user';
    Response response = await Dio().get(url);
    //print('res = $response');

    var result = json.decode(response.data);
    print('result = $result');
    for (var map in result) {
      AdminModel adminModel = AdminModel.fromJson(map);
      if (user == adminModel.user) {
        if (password == adminModel.password) {
          Navigator.pushReplacementNamed(context, CheckRestaurant.id);
        } else {
          normalDialog(context, 'Password you entered is Incorrect ');
        }
      } else {
        normalDialog(
            context, 'Username you entered is not vaild.Please try agin ');
      }
    }
  }
}
