//

import 'dart:math' as math;

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/core/widgets/app_decoration_image.dart';
import 'package:epsilon_app/core/widgets/app_nav_bar.dart';
import 'package:epsilon_app/features/core/home_screen/domain/models/operations.dart';
import 'package:flutter/material.dart';

import 'presentation/widgets/app_icon_button.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});

  _handleAction(BuildContext context, Operations operation) {
    switch (operation) {
      case Operations.subject:
        Navigator.of(context).pushNamed(AppScreens.querySubjectScreen);
        break;
      case Operations.customer:
        print(operation.toString());
        break;
      case Operations.voucher:
        print(operation.toString());
        break;
      case Operations.bill:
        print(operation.toString());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavBar(title: Translator.translation(context).operation_title),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  _decorationImage(),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 16),
                      ...Operations.values.map((e) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: AppIconButton(
                              label: e.title(context),
                              icon: e.icon,
                              onPressed: () => _handleAction(context, e),
                              iconSize: 30,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Transform _decorationImage() {
    return Transform.translate(
      offset: const Offset(177, 0),
      child: Transform.rotate(
        angle: -math.pi / 2,
        child: const AppDecorationImage(),
      ),
    );
  }
}