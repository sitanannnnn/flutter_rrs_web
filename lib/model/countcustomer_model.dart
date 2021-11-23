class CountcustomerModel {
  String? countCustomer;

  CountcustomerModel({this.countCustomer});

  CountcustomerModel.fromJson(Map<String, dynamic> json) {
    countCustomer = json['count_customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_customer'] = this.countCustomer;
    return data;
  }
}
