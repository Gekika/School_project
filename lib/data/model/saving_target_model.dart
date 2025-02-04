class SavingTargetModel {
  final String purposeName;
  final int totalSaving;
  final int hasSaving;
  final int leftSaving;
  final double percentSaving;


  SavingTargetModel({
    required this.purposeName,
    required this.totalSaving,
    required this.hasSaving,
    required this.leftSaving,
    required this.percentSaving,

  });

  factory SavingTargetModel.fromJson(Map<String, dynamic> json) =>
      SavingTargetModel(
        purposeName: json["purpose_name"],
        totalSaving: json["total_saving"],
        hasSaving: json["has_saving"],
        leftSaving: json["left_saving"],
        percentSaving: json["percent_saving"]?.toDouble(),

      );

  Map<String, dynamic> toJson() => {
        "purpose_name": purposeName,
        "total_saving": totalSaving,
        "has_saving": hasSaving,
        "left_saving": leftSaving,
        "percent_saving": percentSaving,

      };
}
