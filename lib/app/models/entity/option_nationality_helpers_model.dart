class OptionNasionalityHelpersModel {
  OptionNasionalityHelpersModel({
    this.label,
    this.value,
    this.pathImg,
    this.selected = false,
  });

  String? label;
  String? value;
  String? pathImg;
  bool? selected;

  factory OptionNasionalityHelpersModel.fromJson(Map<String, dynamic> json) => OptionNasionalityHelpersModel(
        label: json["label"],
        value: json["value"],
        pathImg: json["path_img"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "path_img": pathImg,
      };
}
