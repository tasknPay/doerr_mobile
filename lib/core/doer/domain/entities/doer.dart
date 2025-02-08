import 'package:freezed_annotation/freezed_annotation.dart';

part 'doer.freezed.dart';
part 'doer.g.dart';

@freezed
class Doer with _$Doer {
  const factory Doer({
    required String email,
    required String phone,
    required String name,
    String? token,
    String? password,
  }) = _Doer;

  factory Doer.fromJson(Map<String, dynamic> json) => _$DoerFromJson(json);

  factory Doer.initial() => const Doer(
        email: '',
        phone: '',
        name: '',
        token: '',
        password: '',
      );
}