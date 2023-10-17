class ContactModels {
    int id;
    String name;
    String phone;

    ContactModels({
        required this.id,
        required this.name,
        required this.phone,
    });

    factory ContactModels.fromJson(Map<String, dynamic> json) => ContactModels(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
    };
}
