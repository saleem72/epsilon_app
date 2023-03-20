//

import 'package:epsilon_app/core/localization/language_constants.dart';
import 'package:epsilon_app/core/styling/assets/app_icons.dart';
import 'package:epsilon_app/core/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/styling/topology/topology.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../../../core/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        color: AppColors.neutral95,
        child: Column(
          children: [
            AppNavBar(title: Translator.translation(context).login),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LabledValidateTextFIeld(
                        label: Translator.translation(context).user_name,
                        hint: Translator.translation(context).user_name_hint,
                        errorMessage: Translator.translation(context)
                            .user_name_validation,
                        icon: AppIcons.user,
                        onChange: (value) {},
                        onHasFocus: () {
                          print('user name has focus');
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LabledValidateTextFIeld(
                        label: Translator.translation(context).password,
                        hint: Translator.translation(context).password_hint,
                        icon: AppIcons.lock,
                        isSecure: true,
                        onChange: (value) {},
                      ),
                    ),
                    const SizedBox(height: 30),
                    GradientButton(
                      onPressed: () {},
                      label: Translator.translation(context).ok_button,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        height: 60,
        width: 150,
        child: Center(
          child: Text(
            label,
            style: Topology.title.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.navbar,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 1.5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Topology.title.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
