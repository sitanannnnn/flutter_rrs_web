class ReadrestaurantModel {
  String? restaurantId;
  String? chooseType;
  String? name;
  String? user;
  String? email;
  String? phonenumber;
  String? password;
  String? confirmpassword;
  String? restaurantPicture;
  String? restaurantIdNumber;
  String? restaurantNameshop;
  String? restaurantBranch;
  String? restaurantAddress;
  String? typeOfFood;
  String? vat;
  String? verify;

  ReadrestaurantModel(
      {this.restaurantId,
      this.chooseType,
      this.name,
      this.user,
      this.email,
      this.phonenumber,
      this.password,
      this.confirmpassword,
      this.restaurantPicture,
      this.restaurantIdNumber,
      this.restaurantNameshop,
      this.restaurantBranch,
      this.restaurantAddress,
      this.typeOfFood,
      this.vat,
      this.verify});

  ReadrestaurantModel.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    chooseType = json['chooseType'];
    name = json['name'];
    user = json['user'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    password = json['password'];
    confirmpassword = json['confirmpassword'];
    restaurantPicture = json['restaurantPicture'];
    restaurantIdNumber = json['restaurantIdNumber'];
    restaurantNameshop = json['restaurantNameshop'];
    restaurantBranch = json['restaurantBranch'];
    restaurantAddress = json['restaurantAddress'];
    typeOfFood = json['typeOfFood'];
    vat = json['vat'];
    verify = json['verify'];
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['chooseType'] = this.chooseType;
    data['name'] = this.name;
    data['user'] = this.user;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['password'] = this.password;
    data['confirmpassword'] = this.confirmpassword;
    data['restaurantPicture'] = this.restaurantPicture;
    data['restaurantIdNumber'] = this.restaurantIdNumber;
    data['restaurantNameshop'] = this.restaurantNameshop;
    data['restaurantBranch'] = this.restaurantBranch;
    data['restaurantAddress'] = this.restaurantAddress;
    data['typeOfFood'] = this.typeOfFood;
    data['vat'] = this.vat;
    data['verify'] = this.verify;
    return data;
  }
}
