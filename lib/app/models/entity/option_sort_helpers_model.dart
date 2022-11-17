class OptionSortHelpersModel {
  OptionSortHelpersModel({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory OptionSortHelpersModel.fromJson(Map<String, dynamic> json) => OptionSortHelpersModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
