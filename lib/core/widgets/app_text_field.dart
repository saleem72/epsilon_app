//

import 'package:flutter/material.dart';

import '../styling/assets/app_icons.dart';
import '../styling/colors/app_colors.dart';
import '../styling/topology/topology.dart';

class LabledValidateTextFIeld extends StatelessWidget {
  const LabledValidateTextFIeld({
    super.key,
    this.controller,
    this.focusNode,
    this.onHasFocus,
    this.onLoseFocus,
    this.errorMessage,
    this.isSecure = false,
    required this.label,
    required this.hint,
    required this.icon,
    required this.onChange,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String label;
  final bool isSecure;
  final String hint;
  final String icon;
  final String? errorMessage;
  final Function(String) onChange;
  final Function? onHasFocus;
  final Function? onLoseFocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Topology.subTitle,
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller,
          focusNode: focusNode,
          isSecure: isSecure,
          hint: hint,
          icon: icon,
          onChange: onChange,
          errorMessage: errorMessage,
          onHasFocus: onHasFocus,
          onLoseFocus: onLoseFocus,
        ),
      ],
    );
  }
}

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onHasFocus,
    this.onLoseFocus,
    this.errorMessage,
    required this.isSecure,
    required this.hint,
    required this.icon,
    required this.onChange,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isSecure;
  final String hint;
  final String icon;
  final String? errorMessage;
  final Function(String) onChange;
  final Function? onHasFocus;
  final Function? onLoseFocus;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _isSecure;

  @override
  void initState() {
    super.initState();
    _isSecure = widget.isSecure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 58,
          decoration: BoxDecoration(
            color: AppColors.neutral95,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0, -0.5),
                spreadRadius: 0.5,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 1),
                spreadRadius: 0.5,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Focus(
                    onFocusChange: (value) {
                      if (value) {
                        if (widget.onHasFocus != null) {
                          widget.onHasFocus!();
                        }
                      } else {
                        if (widget.onLoseFocus != null) {
                          widget.onLoseFocus!();
                        }
                      }
                    },
                    child: TextField(
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      obscureText: _isSecure,
                      enableSuggestions: false,
                      autocorrect: false,
                      onChanged: (value) => widget.onChange(value),
                      style: Topology.subTitle,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.hint,
                          hintStyle: Topology.subTitle
                              .copyWith(color: AppColors.secondary)),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage(widget.icon),
                      height: 30,
                      width: 30,
                    ),
                    widget.isSecure
                        ? GestureDetector(
                            onTap: () => setState(() {
                              _isSecure = !_isSecure;
                            }),
                            child: Container(
                              height: 44,
                              width: 44,
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(_isSecure
                                    ? AppIcons.eye
                                    : AppIcons.slashEye),
                                height: 30,
                                width: 30,
                              ),
                            ),
                          )
                        : const SizedBox(width: 30, height: 30),
                  ],
                )
              ],
            ),
          ),
        ),
        widget.errorMessage != null
            ? Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    widget.errorMessage!,
                    style: Topology.subTitle.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
