class OptionWorkSkillHelpersModel {
  OptionWorkSkillHelpersModel({
    this.label,
    this.value,
    this.selected = false,
  });

  String? label;
  String? value;
  bool? selected;

  factory OptionWorkSkillHelpersModel.fromJson(Map<String, dynamic> json) => OptionWorkSkillHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
