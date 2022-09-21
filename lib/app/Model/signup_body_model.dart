class SignUpBodyModel {
  String first_name;
  String last_name;
  String contact_number;
  String address;
  String email;
  String password;
  String password_confirmation;

  SignUpBodyModel({
    required this.first_name,
    required this.last_name,
    required this.contact_number,
    required this.address,
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['contact_number'] = contact_number;
    data['address'] = address;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = password_confirmation;
    return data;
  }
}
