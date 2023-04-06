// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_configuration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionConfigurationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionConfigurationEventCopyWith<$Res> {
  factory $ConnectionConfigurationEventCopyWith(
          ConnectionConfigurationEvent value,
          $Res Function(ConnectionConfigurationEvent) then) =
      _$ConnectionConfigurationEventCopyWithImpl<$Res,
          ConnectionConfigurationEvent>;
}

/// @nodoc
class _$ConnectionConfigurationEventCopyWithImpl<$Res,
        $Val extends ConnectionConfigurationEvent>
    implements $ConnectionConfigurationEventCopyWith<$Res> {
  _$ConnectionConfigurationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CompanyHasChangedCopyWith<$Res> {
  factory _$$_CompanyHasChangedCopyWith(_$_CompanyHasChanged value,
          $Res Function(_$_CompanyHasChanged) then) =
      __$$_CompanyHasChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({Company company});
}

/// @nodoc
class __$$_CompanyHasChangedCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res,
        _$_CompanyHasChanged> implements _$$_CompanyHasChangedCopyWith<$Res> {
  __$$_CompanyHasChangedCopyWithImpl(
      _$_CompanyHasChanged _value, $Res Function(_$_CompanyHasChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
  }) {
    return _then(_$_CompanyHasChanged(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
    ));
  }
}

/// @nodoc

class _$_CompanyHasChanged implements _CompanyHasChanged {
  const _$_CompanyHasChanged({required this.company});

  @override
  final Company company;

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.companyHasChanged(company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompanyHasChanged &&
            (identical(other.company, company) || other.company == company));
  }

  @override
  int get hashCode => Object.hash(runtimeType, company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyHasChangedCopyWith<_$_CompanyHasChanged> get copyWith =>
      __$$_CompanyHasChangedCopyWithImpl<_$_CompanyHasChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return companyHasChanged(company);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return companyHasChanged?.call(company);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (companyHasChanged != null) {
      return companyHasChanged(company);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return companyHasChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return companyHasChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (companyHasChanged != null) {
      return companyHasChanged(this);
    }
    return orElse();
  }
}

abstract class _CompanyHasChanged implements ConnectionConfigurationEvent {
  const factory _CompanyHasChanged({required final Company company}) =
      _$_CompanyHasChanged;

  Company get company;
  @JsonKey(ignore: true)
  _$$_CompanyHasChangedCopyWith<_$_CompanyHasChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UsernameHasChangedCopyWith<$Res> {
  factory _$$_UsernameHasChangedCopyWith(_$_UsernameHasChanged value,
          $Res Function(_$_UsernameHasChanged) then) =
      __$$_UsernameHasChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$_UsernameHasChangedCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res,
        _$_UsernameHasChanged> implements _$$_UsernameHasChangedCopyWith<$Res> {
  __$$_UsernameHasChangedCopyWithImpl(
      _$_UsernameHasChanged _value, $Res Function(_$_UsernameHasChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$_UsernameHasChanged(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UsernameHasChanged implements _UsernameHasChanged {
  const _$_UsernameHasChanged({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.usernameHasChanged(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsernameHasChanged &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsernameHasChangedCopyWith<_$_UsernameHasChanged> get copyWith =>
      __$$_UsernameHasChangedCopyWithImpl<_$_UsernameHasChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return usernameHasChanged(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return usernameHasChanged?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (usernameHasChanged != null) {
      return usernameHasChanged(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return usernameHasChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return usernameHasChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (usernameHasChanged != null) {
      return usernameHasChanged(this);
    }
    return orElse();
  }
}

abstract class _UsernameHasChanged implements ConnectionConfigurationEvent {
  const factory _UsernameHasChanged({required final String username}) =
      _$_UsernameHasChanged;

  String get username;
  @JsonKey(ignore: true)
  _$$_UsernameHasChangedCopyWith<_$_UsernameHasChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordHasChangedCopyWith<$Res> {
  factory _$$_PasswordHasChangedCopyWith(_$_PasswordHasChanged value,
          $Res Function(_$_PasswordHasChanged) then) =
      __$$_PasswordHasChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_PasswordHasChangedCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res,
        _$_PasswordHasChanged> implements _$$_PasswordHasChangedCopyWith<$Res> {
  __$$_PasswordHasChangedCopyWithImpl(
      _$_PasswordHasChanged _value, $Res Function(_$_PasswordHasChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_PasswordHasChanged(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordHasChanged implements _PasswordHasChanged {
  const _$_PasswordHasChanged({required this.password});

  @override
  final String password;

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.passwordHasChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordHasChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordHasChangedCopyWith<_$_PasswordHasChanged> get copyWith =>
      __$$_PasswordHasChangedCopyWithImpl<_$_PasswordHasChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return passwordHasChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return passwordHasChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (passwordHasChanged != null) {
      return passwordHasChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return passwordHasChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return passwordHasChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (passwordHasChanged != null) {
      return passwordHasChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordHasChanged implements ConnectionConfigurationEvent {
  const factory _PasswordHasChanged({required final String password}) =
      _$_PasswordHasChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$_PasswordHasChangedCopyWith<_$_PasswordHasChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_HostHasChangedCopyWith<$Res> {
  factory _$$_HostHasChangedCopyWith(
          _$_HostHasChanged value, $Res Function(_$_HostHasChanged) then) =
      __$$_HostHasChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String host});
}

/// @nodoc
class __$$_HostHasChangedCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res, _$_HostHasChanged>
    implements _$$_HostHasChangedCopyWith<$Res> {
  __$$_HostHasChangedCopyWithImpl(
      _$_HostHasChanged _value, $Res Function(_$_HostHasChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
  }) {
    return _then(_$_HostHasChanged(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HostHasChanged implements _HostHasChanged {
  const _$_HostHasChanged({required this.host});

  @override
  final String host;

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.hostHasChanged(host: $host)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HostHasChanged &&
            (identical(other.host, host) || other.host == host));
  }

  @override
  int get hashCode => Object.hash(runtimeType, host);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostHasChangedCopyWith<_$_HostHasChanged> get copyWith =>
      __$$_HostHasChangedCopyWithImpl<_$_HostHasChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return hostHasChanged(host);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return hostHasChanged?.call(host);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (hostHasChanged != null) {
      return hostHasChanged(host);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return hostHasChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return hostHasChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (hostHasChanged != null) {
      return hostHasChanged(this);
    }
    return orElse();
  }
}

abstract class _HostHasChanged implements ConnectionConfigurationEvent {
  const factory _HostHasChanged({required final String host}) =
      _$_HostHasChanged;

  String get host;
  @JsonKey(ignore: true)
  _$$_HostHasChangedCopyWith<_$_HostHasChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PortHasChangedCopyWith<$Res> {
  factory _$$_PortHasChangedCopyWith(
          _$_PortHasChanged value, $Res Function(_$_PortHasChanged) then) =
      __$$_PortHasChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String port});
}

/// @nodoc
class __$$_PortHasChangedCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res, _$_PortHasChanged>
    implements _$$_PortHasChangedCopyWith<$Res> {
  __$$_PortHasChangedCopyWithImpl(
      _$_PortHasChanged _value, $Res Function(_$_PortHasChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? port = null,
  }) {
    return _then(_$_PortHasChanged(
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PortHasChanged implements _PortHasChanged {
  const _$_PortHasChanged({required this.port});

  @override
  final String port;

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.portHasChanged(port: $port)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortHasChanged &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode => Object.hash(runtimeType, port);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PortHasChangedCopyWith<_$_PortHasChanged> get copyWith =>
      __$$_PortHasChangedCopyWithImpl<_$_PortHasChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return portHasChanged(port);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return portHasChanged?.call(port);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (portHasChanged != null) {
      return portHasChanged(port);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return portHasChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return portHasChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (portHasChanged != null) {
      return portHasChanged(this);
    }
    return orElse();
  }
}

abstract class _PortHasChanged implements ConnectionConfigurationEvent {
  const factory _PortHasChanged({required final String port}) =
      _$_PortHasChanged;

  String get port;
  @JsonKey(ignore: true)
  _$$_PortHasChangedCopyWith<_$_PortHasChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DatabaseHasChangedCopyWith<$Res> {
  factory _$$_DatabaseHasChangedCopyWith(_$_DatabaseHasChanged value,
          $Res Function(_$_DatabaseHasChanged) then) =
      __$$_DatabaseHasChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String database});
}

/// @nodoc
class __$$_DatabaseHasChangedCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res,
        _$_DatabaseHasChanged> implements _$$_DatabaseHasChangedCopyWith<$Res> {
  __$$_DatabaseHasChangedCopyWithImpl(
      _$_DatabaseHasChanged _value, $Res Function(_$_DatabaseHasChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? database = null,
  }) {
    return _then(_$_DatabaseHasChanged(
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DatabaseHasChanged implements _DatabaseHasChanged {
  const _$_DatabaseHasChanged({required this.database});

  @override
  final String database;

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.databaseHasChanged(database: $database)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DatabaseHasChanged &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(runtimeType, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatabaseHasChangedCopyWith<_$_DatabaseHasChanged> get copyWith =>
      __$$_DatabaseHasChangedCopyWithImpl<_$_DatabaseHasChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return databaseHasChanged(database);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return databaseHasChanged?.call(database);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (databaseHasChanged != null) {
      return databaseHasChanged(database);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return databaseHasChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return databaseHasChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (databaseHasChanged != null) {
      return databaseHasChanged(this);
    }
    return orElse();
  }
}

abstract class _DatabaseHasChanged implements ConnectionConfigurationEvent {
  const factory _DatabaseHasChanged({required final String database}) =
      _$_DatabaseHasChanged;

  String get database;
  @JsonKey(ignore: true)
  _$$_DatabaseHasChangedCopyWith<_$_DatabaseHasChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ParamHasChangedCopyWith<$Res> {
  factory _$$_ParamHasChangedCopyWith(
          _$_ParamHasChanged value, $Res Function(_$_ParamHasChanged) then) =
      __$$_ParamHasChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({ConnectionParams params});
}

/// @nodoc
class __$$_ParamHasChangedCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res, _$_ParamHasChanged>
    implements _$$_ParamHasChangedCopyWith<$Res> {
  __$$_ParamHasChangedCopyWithImpl(
      _$_ParamHasChanged _value, $Res Function(_$_ParamHasChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$_ParamHasChanged(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as ConnectionParams,
    ));
  }
}

/// @nodoc

class _$_ParamHasChanged implements _ParamHasChanged {
  const _$_ParamHasChanged({required this.params});

  @override
  final ConnectionParams params;

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.paramHasChanged(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParamHasChanged &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParamHasChangedCopyWith<_$_ParamHasChanged> get copyWith =>
      __$$_ParamHasChangedCopyWithImpl<_$_ParamHasChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return paramHasChanged(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return paramHasChanged?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (paramHasChanged != null) {
      return paramHasChanged(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return paramHasChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return paramHasChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (paramHasChanged != null) {
      return paramHasChanged(this);
    }
    return orElse();
  }
}

abstract class _ParamHasChanged implements ConnectionConfigurationEvent {
  const factory _ParamHasChanged({required final ConnectionParams params}) =
      _$_ParamHasChanged;

  ConnectionParams get params;
  @JsonKey(ignore: true)
  _$$_ParamHasChangedCopyWith<_$_ParamHasChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckConnectionCopyWith<$Res> {
  factory _$$_CheckConnectionCopyWith(
          _$_CheckConnection value, $Res Function(_$_CheckConnection) then) =
      __$$_CheckConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CheckConnectionCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res, _$_CheckConnection>
    implements _$$_CheckConnectionCopyWith<$Res> {
  __$$_CheckConnectionCopyWithImpl(
      _$_CheckConnection _value, $Res Function(_$_CheckConnection) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CheckConnection implements _CheckConnection {
  const _$_CheckConnection();

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.checkConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CheckConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return checkConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return checkConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (checkConnection != null) {
      return checkConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return checkConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return checkConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (checkConnection != null) {
      return checkConnection(this);
    }
    return orElse();
  }
}

abstract class _CheckConnection implements ConnectionConfigurationEvent {
  const factory _CheckConnection() = _$_CheckConnection;
}

/// @nodoc
abstract class _$$_ClearFailureCopyWith<$Res> {
  factory _$$_ClearFailureCopyWith(
          _$_ClearFailure value, $Res Function(_$_ClearFailure) then) =
      __$$_ClearFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearFailureCopyWithImpl<$Res>
    extends _$ConnectionConfigurationEventCopyWithImpl<$Res, _$_ClearFailure>
    implements _$$_ClearFailureCopyWith<$Res> {
  __$$_ClearFailureCopyWithImpl(
      _$_ClearFailure _value, $Res Function(_$_ClearFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearFailure implements _ClearFailure {
  const _$_ClearFailure();

  @override
  String toString() {
    return 'ConnectionConfigurationEvent.clearFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company) companyHasChanged,
    required TResult Function(String username) usernameHasChanged,
    required TResult Function(String password) passwordHasChanged,
    required TResult Function(String host) hostHasChanged,
    required TResult Function(String port) portHasChanged,
    required TResult Function(String database) databaseHasChanged,
    required TResult Function(ConnectionParams params) paramHasChanged,
    required TResult Function() checkConnection,
    required TResult Function() clearFailure,
  }) {
    return clearFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company)? companyHasChanged,
    TResult? Function(String username)? usernameHasChanged,
    TResult? Function(String password)? passwordHasChanged,
    TResult? Function(String host)? hostHasChanged,
    TResult? Function(String port)? portHasChanged,
    TResult? Function(String database)? databaseHasChanged,
    TResult? Function(ConnectionParams params)? paramHasChanged,
    TResult? Function()? checkConnection,
    TResult? Function()? clearFailure,
  }) {
    return clearFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company)? companyHasChanged,
    TResult Function(String username)? usernameHasChanged,
    TResult Function(String password)? passwordHasChanged,
    TResult Function(String host)? hostHasChanged,
    TResult Function(String port)? portHasChanged,
    TResult Function(String database)? databaseHasChanged,
    TResult Function(ConnectionParams params)? paramHasChanged,
    TResult Function()? checkConnection,
    TResult Function()? clearFailure,
    required TResult orElse(),
  }) {
    if (clearFailure != null) {
      return clearFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyHasChanged value) companyHasChanged,
    required TResult Function(_UsernameHasChanged value) usernameHasChanged,
    required TResult Function(_PasswordHasChanged value) passwordHasChanged,
    required TResult Function(_HostHasChanged value) hostHasChanged,
    required TResult Function(_PortHasChanged value) portHasChanged,
    required TResult Function(_DatabaseHasChanged value) databaseHasChanged,
    required TResult Function(_ParamHasChanged value) paramHasChanged,
    required TResult Function(_CheckConnection value) checkConnection,
    required TResult Function(_ClearFailure value) clearFailure,
  }) {
    return clearFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyHasChanged value)? companyHasChanged,
    TResult? Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult? Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult? Function(_HostHasChanged value)? hostHasChanged,
    TResult? Function(_PortHasChanged value)? portHasChanged,
    TResult? Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult? Function(_ParamHasChanged value)? paramHasChanged,
    TResult? Function(_CheckConnection value)? checkConnection,
    TResult? Function(_ClearFailure value)? clearFailure,
  }) {
    return clearFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyHasChanged value)? companyHasChanged,
    TResult Function(_UsernameHasChanged value)? usernameHasChanged,
    TResult Function(_PasswordHasChanged value)? passwordHasChanged,
    TResult Function(_HostHasChanged value)? hostHasChanged,
    TResult Function(_PortHasChanged value)? portHasChanged,
    TResult Function(_DatabaseHasChanged value)? databaseHasChanged,
    TResult Function(_ParamHasChanged value)? paramHasChanged,
    TResult Function(_CheckConnection value)? checkConnection,
    TResult Function(_ClearFailure value)? clearFailure,
    required TResult orElse(),
  }) {
    if (clearFailure != null) {
      return clearFailure(this);
    }
    return orElse();
  }
}

abstract class _ClearFailure implements ConnectionConfigurationEvent {
  const factory _ClearFailure() = _$_ClearFailure;
}

/// @nodoc
mixin _$ConnectionConfigurationState {
  Option<Company> get company => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  String get port => throw _privateConstructorUsedError;
  String get database => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get connectSuccessfully => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionConfigurationStateCopyWith<ConnectionConfigurationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionConfigurationStateCopyWith<$Res> {
  factory $ConnectionConfigurationStateCopyWith(
          ConnectionConfigurationState value,
          $Res Function(ConnectionConfigurationState) then) =
      _$ConnectionConfigurationStateCopyWithImpl<$Res,
          ConnectionConfigurationState>;
  @useResult
  $Res call(
      {Option<Company> company,
      String username,
      String password,
      String host,
      String port,
      String database,
      Option<Failure> failure,
      bool isLoading,
      bool connectSuccessfully});
}

/// @nodoc
class _$ConnectionConfigurationStateCopyWithImpl<$Res,
        $Val extends ConnectionConfigurationState>
    implements $ConnectionConfigurationStateCopyWith<$Res> {
  _$ConnectionConfigurationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? username = null,
    Object? password = null,
    Object? host = null,
    Object? port = null,
    Object? database = null,
    Object? failure = null,
    Object? isLoading = null,
    Object? connectSuccessfully = null,
  }) {
    return _then(_value.copyWith(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Option<Company>,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      connectSuccessfully: null == connectSuccessfully
          ? _value.connectSuccessfully
          : connectSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res>
    implements $ConnectionConfigurationStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Company> company,
      String username,
      String password,
      String host,
      String port,
      String database,
      Option<Failure> failure,
      bool isLoading,
      bool connectSuccessfully});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$ConnectionConfigurationStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? username = null,
    Object? password = null,
    Object? host = null,
    Object? port = null,
    Object? database = null,
    Object? failure = null,
    Object? isLoading = null,
    Object? connectSuccessfully = null,
  }) {
    return _then(_$_HomeState(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Option<Company>,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      connectSuccessfully: null == connectSuccessfully
          ? _value.connectSuccessfully
          : connectSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  const _$_HomeState(
      {required this.company,
      required this.username,
      required this.password,
      required this.host,
      required this.port,
      required this.database,
      required this.failure,
      required this.isLoading,
      required this.connectSuccessfully})
      : super._();

  @override
  final Option<Company> company;
  @override
  final String username;
  @override
  final String password;
  @override
  final String host;
  @override
  final String port;
  @override
  final String database;
  @override
  final Option<Failure> failure;
  @override
  final bool isLoading;
  @override
  final bool connectSuccessfully;

  @override
  String toString() {
    return 'ConnectionConfigurationState(company: $company, username: $username, password: $password, host: $host, port: $port, database: $database, failure: $failure, isLoading: $isLoading, connectSuccessfully: $connectSuccessfully)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.database, database) ||
                other.database == database) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.connectSuccessfully, connectSuccessfully) ||
                other.connectSuccessfully == connectSuccessfully));
  }

  @override
  int get hashCode => Object.hash(runtimeType, company, username, password,
      host, port, database, failure, isLoading, connectSuccessfully);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState extends ConnectionConfigurationState {
  const factory _HomeState(
      {required final Option<Company> company,
      required final String username,
      required final String password,
      required final String host,
      required final String port,
      required final String database,
      required final Option<Failure> failure,
      required final bool isLoading,
      required final bool connectSuccessfully}) = _$_HomeState;
  const _HomeState._() : super._();

  @override
  Option<Company> get company;
  @override
  String get username;
  @override
  String get password;
  @override
  String get host;
  @override
  String get port;
  @override
  String get database;
  @override
  Option<Failure> get failure;
  @override
  bool get isLoading;
  @override
  bool get connectSuccessfully;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
