class UserModels {
    int userId;
    int id;
    String title;
    String body;

    UserModels({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
