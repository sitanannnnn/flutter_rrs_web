import 'package:flutter/material.dart';

import 'package:flutter_web/screen/Login.dart';
import 'package:flutter_web/screen/check_restaurant.dart';

import 'package:flutter_web/screen/restaurant_information.dart';

import 'package:flutter_web/screen/unverified_restaurant.dart';
import 'package:flutter_web/screen/user_information.dart';
import 'package:flutter_web/screen/verified_restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retaurant reservation system Admin',
      theme: ThemeData(
        primaryColor: Color(0xFF336699),
      ),
      home: Login(),
      routes: {
        Login.id: (context) => Login(),
        CheckRestaurant.id: (context) => CheckRestaurant(),
        RestaurantInformation.id: (context) => RestaurantInformation(),
        UserInformation.id: (context) => UserInformation(),
        VerifiedRestaurant.id: (context) => VerifiedRestaurant(),
        UnverifiedRestaurant.id: (context) => UnverifiedRestaurant()
      },
    );
  }
}
