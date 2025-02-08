// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Doer _$DoerFromJson(Map<String, dynamic> json) {
  return _Doer.fromJson(json);
}

/// @nodoc
mixin _$Doer {
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this Doer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Doer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoerCopyWith<Doer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoerCopyWith<$Res> {
  factory $DoerCopyWith(Doer value, $Res Function(Doer) then) =
      _$DoerCopyWithImpl<$Res, Doer>;
  @useResult
  $Res call({String email, String phone, String name, String? token});
}

/// @nodoc
class _$DoerCopyWithImpl<$Res, $Val extends Doer>
    implements $DoerCopyWith<$Res> {
  _$DoerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Doer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? name = null,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoerImplCopyWith<$Res> implements $DoerCopyWith<$Res> {
  factory _$$DoerImplCopyWith(
          _$DoerImpl value, $Res Function(_$DoerImpl) then) =
      __$$DoerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String phone, String name, String? token});
}

/// @nodoc
class __$$DoerImplCopyWithImpl<$Res>
    extends _$DoerCopyWithImpl<$Res, _$DoerImpl>
    implements _$$DoerImplCopyWith<$Res> {
  __$$DoerImplCopyWithImpl(_$DoerImpl _value, $Res Function(_$DoerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Doer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? name = null,
    Object? token = freezed,
  }) {
    return _then(_$DoerImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoerImpl implements _Doer {
  const _$DoerImpl(
      {required this.email,
      required this.phone,
      required this.name,
      this.token});

  factory _$DoerImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoerImplFromJson(json);

  @override
  final String email;
  @override
  final String phone;
  @override
  final String name;
  @override
  final String? token;

  @override
  String toString() {
    return 'Doer(email: $email, phone: $phone, name: $name, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoerImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, phone, name, token);

  /// Create a copy of Doer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoerImplCopyWith<_$DoerImpl> get copyWith =>
      __$$DoerImplCopyWithImpl<_$DoerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoerImplToJson(
      this,
    );
  }
}

abstract class _Doer implements Doer {
  const factory _Doer(
      {required final String email,
      required final String phone,
      required final String name,
      final String? token}) = _$DoerImpl;

  factory _Doer.fromJson(Map<String, dynamic> json) = _$DoerImpl.fromJson;

  @override
  String get email;
  @override
  String get phone;
  @override
  String get name;
  @override
  String? get token;

  /// Create a copy of Doer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoerImplCopyWith<_$DoerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
