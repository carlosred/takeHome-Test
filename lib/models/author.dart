class Author {
  String? name;
  String? email;
  String? date;

  Author({this.name, this.email, this.date});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['date'] = date;
    return data;
  }
}
