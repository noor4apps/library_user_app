class UserModel {
  int? id;
  String? first_name;
  String? last_name;
  String? contact_number;
  String? address;
  String? email;

  late String? full_name = '${first_name! + ' ' + last_name!}';

  UserModel({
    this.id,
    this.first_name,
    this.last_name,
    this.contact_number,
    this.address,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    full_name = full_name;
    contact_number = json['contact_number'];
    address = json['address'];
    email = json['email'];
  }

}
