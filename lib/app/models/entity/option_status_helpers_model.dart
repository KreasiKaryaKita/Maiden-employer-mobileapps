class OptionStatusHelpersModel {
  OptionStatusHelpersModel({
    this.label,
    this.value,
    this.selected = false,
  });

  String? label;
  String? value;
  bool? selected;

  factory OptionStatusHelpersModel.fromJson(Map<String, dynamic> json) => OptionStatusHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
