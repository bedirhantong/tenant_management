import 'base_model.dart';

class PagedBaseModel<T> extends BaseModel<T> {
  const PagedBaseModel({
    this.currentPage = 0,
    this.totalPages = 0,
    this.totalCount = 0,
    this.pageSize = 0,
    this.hasPreviousPage = false,
    this.hasNextPage = false,
    String? source = "Mobile",
    String? exception = "In Class Error",
    String? errorId = "999",
    String? supportMessage = "Notify to App Developer",
    int? statusCode = 999,
    List<String>? messages = const ["Class Error"],
    T? data,
  }) : super(
          source: source ?? "Mobile",
          exception: exception ?? "In Class Error",
          errorId: errorId ?? "999",
          supportMessage: supportMessage ?? "Notify to App Developer",
          statusCode: statusCode ?? 999,
          messages: messages ?? const ["Class Error"],
          data: data,
        );

  final int? currentPage;
  final int? totalPages;
  final int? totalCount;
  final int? pageSize;
  final bool? hasPreviousPage;
  final bool? hasNextPage;

  factory PagedBaseModel.fromJson(
      {Map<String, dynamic> json = const {}, T? d, int statusCode = 777}) {
    return PagedBaseModel<T>(
      currentPage: json["currentPage"] ?? 0,
      totalPages: json["totalPages"] ?? 0,
      totalCount: json["totalCount"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      hasPreviousPage: json["hasPreviousPage"] ?? false,
      hasNextPage: json["hasNextPage"] ?? false,
      source: json["source"] ?? "Mobile",
      exception: json["exception"] ?? "In Json Error",
      errorId: json["errorId"] ?? "777",
      supportMessage: json["supportMessage"] ?? "Notify to App Developer",
      statusCode: json["statusCode"] ?? statusCode,
      messages: json["messages"] == null
          ? ["Json Parse Error"]
          : List<String>.from(
              json["messages"].map((x) => x.toString()),
            ),
      data: d,
    );
  }
}
