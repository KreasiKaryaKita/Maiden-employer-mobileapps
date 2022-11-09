// To parse this JSON data, do
//
//     final optionCountryHelpersModel = optionCountryHelpersModelFromJson(jsonString);
class OptionCountryHelpersModel {
  OptionCountryHelpersModel({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory OptionCountryHelpersModel.fromJson(Map<String, dynamic> json) => OptionCountryHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
