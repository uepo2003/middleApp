// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'themeSystem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeSystemModel {
  ThemeMode get theme => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeSystemModelCopyWith<ThemeSystemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeSystemModelCopyWith<$Res> {
  factory $ThemeSystemModelCopyWith(
          ThemeSystemModel value, $Res Function(ThemeSystemModel) then) =
      _$ThemeSystemModelCopyWithImpl<$Res, ThemeSystemModel>;
  @useResult
  $Res call({ThemeMode theme, bool value});
}

/// @nodoc
class _$ThemeSystemModelCopyWithImpl<$Res, $Val extends ThemeSystemModel>
    implements $ThemeSystemModelCopyWith<$Res> {
  _$ThemeSystemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeSystemModelImplCopyWith<$Res>
    implements $ThemeSystemModelCopyWith<$Res> {
  factory _$$ThemeSystemModelImplCopyWith(_$ThemeSystemModelImpl value,
          $Res Function(_$ThemeSystemModelImpl) then) =
      __$$ThemeSystemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode theme, bool value});
}

/// @nodoc
class __$$ThemeSystemModelImplCopyWithImpl<$Res>
    extends _$ThemeSystemModelCopyWithImpl<$Res, _$ThemeSystemModelImpl>
    implements _$$ThemeSystemModelImplCopyWith<$Res> {
  __$$ThemeSystemModelImplCopyWithImpl(_$ThemeSystemModelImpl _value,
      $Res Function(_$ThemeSystemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? value = null,
  }) {
    return _then(_$ThemeSystemModelImpl(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ThemeSystemModelImpl implements _ThemeSystemModel {
  const _$ThemeSystemModelImpl({required this.theme, this.value = false});

  @override
  final ThemeMode theme;
  @override
  @JsonKey()
  final bool value;

  @override
  String toString() {
    return 'ThemeSystemModel(theme: $theme, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeSystemModelImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeSystemModelImplCopyWith<_$ThemeSystemModelImpl> get copyWith =>
      __$$ThemeSystemModelImplCopyWithImpl<_$ThemeSystemModelImpl>(
          this, _$identity);
}

abstract class _ThemeSystemModel implements ThemeSystemModel {
  const factory _ThemeSystemModel(
      {required final ThemeMode theme,
      final bool value}) = _$ThemeSystemModelImpl;

  @override
  ThemeMode get theme;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$$ThemeSystemModelImplCopyWith<_$ThemeSystemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
