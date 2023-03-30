//

import 'dart:math';

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/database_communicator/presentation/bloc/database_communicator.dart';
import '../../../../core/utils/styling/assets/app_icons.dart';
import '../../../../core/utils/styling/colors/app_colors.dart';
import '../../../../core/widgets/app_nav_bar.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../product_details_screen/product_details_screen.dart';
import 'presentation/widgets/scanner_view.dart';

class QueryProductScreen extends StatefulWidget {
  const QueryProductScreen({super.key});

  @override
  State<QueryProductScreen> createState() => _QueryProductScreenState();
}

class _QueryProductScreenState extends State<QueryProductScreen> {
  final TextEditingController _serial = TextEditingController();

  @override
  void dispose() {
    _serial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavBar(
              title: Translator.translation(context).query_subject_screen),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    _scnnerArea(context),
                    const SizedBox(height: 45),
                    _orRow(context),
                    const SizedBox(height: 45),
                    _serialTextFIeld(context),
                  ],
                ),
              ),
            ),
          ),
          _executeButton(context)
        ],
      ),
    );
  }

  double getScanAreaHeight(BuildContext context) {
    const double contentHeight = 88 // appBar
        +
        (30 * 2) // scan area vertical padding
        +
        45 // gap
        +
        24 // or
        +
        45 // gap
        +
        82 // text field
        +
        60; // button
    final totalHeight = MediaQuery.of(context).size.height;
    return totalHeight - contentHeight;
  }

  Widget _scnnerArea(BuildContext context) {
    final height = getScanAreaHeight(context);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: _scannerView(context, height),
    );
  }

  // ignore: unused_element
  Widget _faceCam() {
    final height = getScanAreaHeight(context);
    final shortSide = min(MediaQuery.of(context).size.width, height);
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: shortSide - 80,
        width: shortSide - 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _scannerView(BuildContext context, double height) {
    final height = getScanAreaHeight(context);
    final width = MediaQuery.of(context).size.width - 32;

    return ScannerView(
      onGettingBarcode: (barcode) => _handleBarcode(context, barcode),
      borderRadius: 30,
      height: height,
      width: width,
    );
  }

  Widget _executeButton(BuildContext context) {
    return GradientButton(
      label: Translator.translation(context).ok_button,
      isEnabled: _serial.text.isNotEmpty,
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_serial.text.isNotEmpty) {
          context.read<DatabaseCommunicator>().add(
                GetProductBySerial(serial: _serial.text),
              );
          // Navigator.of(context).pushNamed(AppScreens.subjectDetailsScreen);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => const ProductDetailsScreen()),
          );
        }
      },
    );
  }

  Widget _serialTextFIeld(BuildContext context) {
    return LabledValidateTextFIeld(
      controller: _serial,
      label: Translator.translation(context).serial_number,
      hint: Translator.translation(context).serial_number_hint,
      icon: AppIcons.serialNumber,
      onChange: (_) {},
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

  void _handleBarcode(BuildContext context, String barcode) {
    context.read<DatabaseCommunicator>().add(
          GetProductByBarCode(barcode: barcode),
        );
    // Navigator.of(context).pushNamed(AppScreens.subjectDetailsScreen);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ProductDetailsScreen()),
    );
  }
}
