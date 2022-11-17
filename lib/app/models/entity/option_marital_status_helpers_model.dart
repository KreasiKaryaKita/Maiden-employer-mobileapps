class OptionMaritalStatusHelpersModel {
  OptionMaritalStatusHelpersModel({
    this.label,
    this.value,
    this.selected = false,
  });

  String? label;
  String? value;
  bool? selected;

  factory OptionMaritalStatusHelpersModel.fromJson(Map<String, dynamic> json) => OptionMaritalStatusHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
