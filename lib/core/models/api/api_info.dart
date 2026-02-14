import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_info.freezed.dart';
part 'api_info.g.dart';

@freezed
class ApiInfo with _$ApiInfo {
  const factory ApiInfo({
    @Default(0) int count,
    @Default(0) int pages,
    String? next,
    String? prev,
  }) = _ApiInfo;

  factory ApiInfo.fromJson(Map<String, dynamic> json) =>
      _$ApiInfoFromJson(json);
}
