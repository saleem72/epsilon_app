//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/core/utils/styling/assets/app_icons.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/widgets/app_nav_bar.dart';
import 'package:epsilon_app/core/widgets/app_text_field.dart';
import 'package:epsilon_app/core/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class QuerySubjectScreen extends StatelessWidget {
  const QuerySubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppNavBar(
              title: Translator.translation(context).query_subject_screen),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        height: 223,
                        width: 223,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  _orRow(context),
                  const SizedBox(height: 45),
                  LabledValidateTextFIeld(
                    label: Translator.translation(context).serial_number,
                    hint: Translator.translation(context).serial_number_hint,
                    icon: AppIcons.serialNumber,
                    onChange: (_) {},
                  ),
                ],
              ),
            ),
          ),
          GradientButton(
            label: Translator.translation(context).ok_button,
            onPressed: () => Navigator.of(context)
                .pushNamed(AppScreens.subjectDetailsScreen),
          )
        ],
      ),
    );
  }

  Widget _orRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.primaryLight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(Translator.translation(context).or_label),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.primaryLight,
          ),
        ),
      ],
    );
  }
}
