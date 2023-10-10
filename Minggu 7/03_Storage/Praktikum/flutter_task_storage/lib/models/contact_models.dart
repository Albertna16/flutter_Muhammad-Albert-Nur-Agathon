class ContactModels {
  late int? id;
  late String name;
  late String number;

  ContactModels({
    this.id,
    required this.name,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "number": number,
    };
  }

  ContactModels.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    number = map["number"];
  }
}