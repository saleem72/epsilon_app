//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/features/auth/login_screen/login_screen.dart';
import 'package:epsilon_app/features/core/home_screen/domain/models/companies.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/styling/assets/app_icons.dart';
import '../../../core/utils/styling/colors/app_colors.dart';
import '../../../core/utils/styling/topology/topology.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/gradient_button.dart';
import 'presentation/widgets/companies_dropdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavBar(title: Translator.translation(context).pick_company),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CompaniesDropDown(),
                  ),
                  const SizedBox(height: 30),
                  _usernameTextField(context),
                  const SizedBox(height: 30),
                  _passwordTextField(context),
                  const SizedBox(height: 30),
                  _databaseURl(context),
                  const SizedBox(height: 30),
                  _databasePort(context),
                  const SizedBox(height: 30),
                  _loginButton(context, true),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        label: Translator.translation(context).password,
        hint: Translator.translation(context).password_hint,
        icon: AppIcons.lock,
        isSecure: true,
        onChange: (value) {},
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _usernameTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        label: Translator.translation(context).user_name,
        hint: Translator.translation(context).user_name_hint,
        icon: AppIcons.user,
        onChange: (value) {},
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _databasePort(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        label: Translator.translation(context).database_port,
        hint: Translator.translation(context).database_port_hint,
        icon: AppIcons.database,
        onChange: (value) {},
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _databaseURl(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        label: Translator.translation(context).database_url,
        hint: Translator.translation(context).database_url_hint,
        icon: AppIcons.database,
        onChange: (value) {},
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _loginButton(BuildContext context, bool isEnabled) {
    return GradientButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // context.read<LoginBloc>().add(LoginExecute());
      },
      isEnabled: isEnabled,
      label: Translator.translation(context).ok_button,
    );
  }
}
