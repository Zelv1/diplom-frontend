class UserModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  Courier? courier;
  Vendor? vendor;

  UserModel(jsonData, 
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.courier,
      this.vendor});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    courier =
        json['courier'] != null ? new Courier.fromJson(json['courier']) : null;
    vendor =
        json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.courier != null) {
      data['courier'] = this.courier!.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    return data;
  }
}

class Courier {
  int? id;
  String? name;
  int? drivingExperience;
  String? number;

  Courier({this.id, this.name, this.drivingExperience, this.number});

  Courier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    drivingExperience = json['drivingExperience'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['drivingExperience'] = this.drivingExperience;
    data['number'] = this.number;
    return data;
  }
}

class Vendor {
  int? id;
  String? adress;
  String? nameOfOrganization;

  Vendor({this.id, this.adress, this.nameOfOrganization});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adress = json['adress'];
    nameOfOrganization = json['nameOfOrganization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adress'] = this.adress;
    data['nameOfOrganization'] = this.nameOfOrganization;
    return data;
  }
}
