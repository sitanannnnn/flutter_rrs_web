import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_web/screen/restaurant_information.dart';
import 'package:flutter_web/screen/unverified_restaurant.dart';
import 'package:flutter_web/screen/user_information.dart';
import 'package:flutter_web/screen/verified_restaurant.dart';

import 'check_restaurant.dart';

class SideBarWidget {
  sideBarMenus(context, selectedRoute) {
    return SideBar(
      activeBackgroundColor: Colors.black54,
      activeIconColor: Colors.white,
      activeTextStyle: TextStyle(color: Colors.white),
      items: const [
        MenuItem(
          title: 'Check restaurant',
          route: CheckRestaurant.id,
          icon: Icons.check_circle_sharp,
        ),
        MenuItem(
          title: 'Verified restaurant',
          route: VerifiedRestaurant.id,
          icon: Icons.check,
        ),
        MenuItem(
          title: 'Unverified restaurant',
          route: UnverifiedRestaurant.id,
          icon: Icons.clear,
        ),
        MenuItem(
          title: 'Restaurant information',
          route: RestaurantInformation.id,
          icon: Icons.store_rounded,
        ),
        MenuItem(
          title: 'User information',
          route: UserInformation.id,
          icon: Icons.person_sharp,
        ),
        MenuItem(
          title: 'Log out',
          route: '/',
          icon: Icons.logout_rounded,
        ),
      ],
      selectedRoute: selectedRoute,
      onSelected: (item) {
        if (item.route != null) {
          Navigator.of(context).pushNamed(item.route!);
        }
      },
      header: Container(
        height: 100,
        width: double.infinity,
        color: Color(0xFF336699),
        child: Center(
          child: Text(
            'Admin CDG',
            style:
                TextStyle(color: Colors.white, fontSize: 35, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
