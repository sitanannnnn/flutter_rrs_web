class AdminModel {
  String? adminId;
  String? name;
  String? user;
  String? password;

  AdminModel({this.adminId, this.name, this.user, this.password});

  AdminModel.fromJson(Map<String, dynamic> json) {
    adminId = json['admin_id'];
    name = json['name'];
    user = json['user'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_id'] = this.adminId;
    data['name'] = this.name;
    data['user'] = this.user;
    data['password'] = this.password;
    return data;
  }
}
