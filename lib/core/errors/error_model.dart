import 'package:checkout_feature/core/api/end_pointes.dart';

class ErrorModel {
  final String? type;
  final String errorMessage;

  ErrorModel({this.type, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      type: jsonData[ApiKey.error][ApiKey.type],
      errorMessage: jsonData[ApiKey.error][ApiKey.errorMessage],
    );
  }
}
