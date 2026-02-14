import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_location_ref.freezed.dart';
part 'api_location_ref.g.dart';

@freezed
class ApiLocationRef with _$ApiLocationRef {
  const factory ApiLocationRef({
    @Default('') String name,
    @Default('') String url,
  }) = _ApiLocationRef;

  factory ApiLocationRef.fromJson(Map<String, dynamic> json) =>
      _$ApiLocationRefFromJson(json);
}
