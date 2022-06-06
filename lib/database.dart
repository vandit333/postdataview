class database {
  String? id;
  String? name;
  String? contact;

  database({this.id, this.name, this.contact});

  database.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    return data;
  }
}
