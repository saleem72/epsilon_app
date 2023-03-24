// Mocks generated by Mockito 5.3.2 from annotations
// in epsilon_app/test/features/auth/login_screen/dependancies/validators/validators_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:epsilon_app/core/usecases/validate_password.dart' as _i4;
import 'package:epsilon_app/core/usecases/validate_username.dart' as _i2;
import 'package:epsilon_app/core/usecases/validation_status.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ValidateUsername].
///
/// See the documentation for Mockito's code generation for more information.
class MockValidateUsername extends _i1.Mock implements _i2.ValidateUsername {
  MockValidateUsername() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ValidationStatus call(String? username) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [username],
        ),
        returnValue: _i3.ValidationStatus.valid,
      ) as _i3.ValidationStatus);
}

/// A class which mocks [ValidatePassword].
///
/// See the documentation for Mockito's code generation for more information.
class MockValidatePassword extends _i1.Mock implements _i4.ValidatePassword {
  MockValidatePassword() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ValidationStatus call(String? password) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [password],
        ),
        returnValue: _i3.ValidationStatus.valid,
      ) as _i3.ValidationStatus);
}
