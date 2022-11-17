class OptionEducationHelpersModel {
  OptionEducationHelpersModel({
    this.label,
    this.value,
    this.selected = false,
  });

  String? label;
  String? value;
  bool? selected;

  factory OptionEducationHelpersModel.fromJson(Map<String, dynamic> json) => OptionEducationHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
