//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:epsilon_app/core/utils/styling/assets/app_icons.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/utils/text_field_formmaters/text_field_formmaters.dart';
import 'package:epsilon_app/core/widgets/error_view.dart';
import 'package:epsilon_app/core/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/app_decoration_image.dart';
import '../../../core/widgets/app_nav_bar.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../dependancy_injection.dart' as di;
import 'presentation/login_bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.onLoginSuccess});
  final Function onLoginSuccess;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => di.locator(),
      child: LoginScreenContent(onLoginSuccess: onLoginSuccess),
    );
  }
}

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({
    super.key,
    required this.onLoginSuccess,
  });
  final Function onLoginSuccess;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppColors.neutral95,
        child: Column(
          children: [
            AppNavBar(title: Translator.translation(context).login),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Transform.translate(
                          offset: const Offset(118, 157),
                          child: _decorationImage(),
                        ),
                      ),
                      _textFields(context, state),
                      LoadingView(isLoading: state.isLoading),
                      ErrorView(
                        onAction: () =>
                            context.read<LoginBloc>().add(LoginClearFailure()),
                        failure: state.failure,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFields(BuildContext context, LoginState state) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 30),
        _usernameTextField(context, state.usernameStatus),
        const SizedBox(height: 30),
        _passwordTextField(context, state.passwordStatus),
        const SizedBox(height: 30),
        _loginButton(context, state.isValid),
        _handleSuccsess(context, state.loginSuccessfully)
      ],
    ));
  }

  Widget _decorationImage() {
    // width: 177.63, height: 401.2
    return const AppDecorationImage();
  }

  Widget _handleSuccsess(BuildContext context, bool success) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginSuccessfully) {
          onLoginSuccess();
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  Widget _loginButton(BuildContext context, bool isEnabled) {
    return GradientButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        context.read<LoginBloc>().add(LoginExecute());
      },
      isEnabled: isEnabled,
      label: Translator.translation(context).ok_button,
    );
  }

  Widget _passwordTextField(BuildContext context, ValidationStatus? valid) {
    final bloc = context.read<LoginBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        label: Translator.translation(context).password,
        hint: Translator.translation(context).password_hint,
        icon: AppIcons.lock,
        keyboard: TextInputType.visiblePassword,
        errorMessage: valid?.message(context),
        isSecure: true,
        onChange: (value) => bloc.add(LoginPasswordHasChanged(password: value)),
        onHasFocus: () => bloc.add(LoginClearPasswordError()),
        onLoseFocus: () => bloc.add(LoginPasswordLostFocus()),
      ),
    );
  }

  Widget _usernameTextField(BuildContext context, ValidationStatus? valid) {
    final bloc = context.read<LoginBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        label: Translator.translation(context).user_name,
        hint: Translator.translation(context).user_name_hint,
        errorMessage: valid?.message(context),
        icon: AppIcons.user,
        keyboard: TextInputType.emailAddress,
        formmaters: TextFieldFormmaters.letterAndNumbersTextField,
        onChange: (value) => bloc.add(LoginUsernameHasChanged(username: value)),
        onHasFocus: () => bloc.add(LoginClearUsernameError()),
        onLoseFocus: () => bloc.add(LoginUsernameLostFocus()),
      ),
    );
  }
}
