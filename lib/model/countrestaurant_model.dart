class CountrestaurantModel {
  String? countRestaurant;

  CountrestaurantModel({this.countRestaurant});

  CountrestaurantModel.fromJson(Map<String, dynamic> json) {
    countRestaurant = json['count_restaurant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_restaurant'] = this.countRestaurant;
    return data;
  }
}
