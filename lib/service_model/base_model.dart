class BaseModel<T> {
  const BaseModel({
    this.source = "Mobile",
    this.exception = "In Class Error",
    this.errorId = "999",
    this.supportMessage = "Notify to App Developer",
    this.statusCode = 999,
    this.messages = const ["Class Error"],
    this.data,
  });

  final String? source;
  final String? exception;
  final String? errorId;
  final String? supportMessage;
  final int? statusCode;
  final List<String>? messages;
  final T? data;

  bool get suc => statusCode == null ? false : statusCode == 200;

  factory BaseModel.fromJson({Map<String, dynamic> json = const {}, T? d}) =>
      BaseModel(
        source: json["source"] ?? "Mobile",
        exception: json["exception"] ?? "In Json Error",
        errorId: json["errorId"] ?? "777",
        supportMessage: json["supportMessage"] ?? "Notify to App Developer",
        statusCode: json["statusCode"] ?? 777,
        messages: json["messages"] == null
            ? ["Json Parse Error"]
            : List<String>.from(
                json["messages"].map((x) => x.toString()),
              ),
        data: d,
      );
}
