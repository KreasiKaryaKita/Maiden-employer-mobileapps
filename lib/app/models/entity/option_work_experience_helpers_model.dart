class OptionWorkExperienceHelpersModel {
  OptionWorkExperienceHelpersModel({
    this.label,
    this.value,
    this.selected = false,
  });

  String? label;
  String? value;
  bool? selected;

  factory OptionWorkExperienceHelpersModel.fromJson(Map<String, dynamic> json) => OptionWorkExperienceHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
