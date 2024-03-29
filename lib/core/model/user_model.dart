class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? address;
  String? status;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.address,
    this.status,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    address = json['address'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['address'] = address;
    data['status'] = status;

    return data;
  }
}
