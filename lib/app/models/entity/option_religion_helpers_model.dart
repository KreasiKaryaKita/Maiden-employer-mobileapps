class OptionReligionHelpersModel {
  OptionReligionHelpersModel({
    this.label,
    this.value,
    this.selected = false,
  });

  String? label;
  String? value;
  bool? selected;

  factory OptionReligionHelpersModel.fromJson(Map<String, dynamic> json) => OptionReligionHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
