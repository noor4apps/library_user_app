class Author {
  late int id;
  late String name;

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
