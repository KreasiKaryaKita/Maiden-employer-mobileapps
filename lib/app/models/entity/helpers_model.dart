class HelpersModel {
  HelpersModel({
    this.image,
    this.name,
    this.age,
    this.experience,
    this.readyDate,
    this.country,
  });

  String? image;
  String? name;
  int? age;
  int? experience;
  DateTime? readyDate;
  String? country;

  factory HelpersModel.fromJson(Map<String, dynamic> json) => HelpersModel(
        image: json["image"],
        name: json["name"],
        age: json["age"],
        experience: json["experience"],
        readyDate: DateTime.parse(json["ready_date"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "age": age,
        "experience": experience,
        "ready_date":
            "${readyDate!.year.toString().padLeft(4, '0')}-${readyDate!.month.toString().padLeft(2, '0')}-${readyDate!.day.toString().padLeft(2, '0')}",
        "country": country,
      };
}
