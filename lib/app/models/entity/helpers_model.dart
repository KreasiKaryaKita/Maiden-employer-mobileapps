class HelpersModel {
  HelpersModel({
    this.id,
    this.image,
    this.name,
    this.age,
    this.experience,
    this.readyDate,
    this.country,
  });

  int? id;
  String? image;
  String? name;
  int? age;
  int? experience;
  DateTime? readyDate;
  String? country;

  factory HelpersModel.fromJson(Map<String, dynamic> json) => HelpersModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        age: json["age"],
        experience: json["experience"],
        readyDate: json["ready_date"] == null ? null : DateTime.parse(json["ready_date"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "age": age,
        "experience": experience,
        "ready_date": readyDate == null
            ? null
            : "${readyDate!.year.toString().padLeft(4, '0')}-${readyDate!.month.toString().padLeft(2, '0')}-${readyDate!.day.toString().padLeft(2, '0')}",
        "country": country,
      };
}
