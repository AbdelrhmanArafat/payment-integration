class FinalTokenModel {
  String token;

  FinalTokenModel({
    required this.token,
  });

  factory FinalTokenModel.fromJson(Map<String, dynamic> json) =>
      FinalTokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
