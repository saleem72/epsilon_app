//

import 'package:epsilon_app/core/errors/failure/failure.dart';
import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/utils/styling/topology/topology.dart';
import 'package:epsilon_app/core/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.failure,
    required this.onAction,
  });
  final Failure? failure;
  final Function onAction;
  @override
  Widget build(BuildContext context) {
    return failure != null
        ? Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 54, bottom: 38),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          failure!.message(context),
                          style: Topology.largeTitle.copyWith(
                            color: AppColors.primaryDark,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    GradientButton(
                      label: Translator.translation(context).try_again,
                      onPressed: () => onAction(),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
