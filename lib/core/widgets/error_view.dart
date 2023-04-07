//

import 'package:epsilon_app/core/extensions/build_context_extension.dart';
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
  final String? failure;
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
                        Expanded(
                          child: Text(
                            failure!,
                            style: Topology.largeTitle.copyWith(
                              color: AppColors.primaryDark,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    GradientButton(
                      label: context.translate.try_again,
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

class GeneralErrorView extends StatelessWidget {
  const GeneralErrorView({
    super.key,
    this.failure,
    required this.onAction,
  });
  final String? failure;
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
                        Expanded(
                          child: Text(
                            failure!,
                            style: Topology.largeTitle.copyWith(
                              color: AppColors.primaryDark,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    GradientButton(
                      label: context.translate.try_again,
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
