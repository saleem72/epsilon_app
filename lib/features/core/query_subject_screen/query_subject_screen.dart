//

import 'dart:io';

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/core/utils/styling/assets/app_icons.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/widgets/app_nav_bar.dart';
import 'package:epsilon_app/core/widgets/app_text_field.dart';
import 'package:epsilon_app/core/widgets/gradient_button.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_manager/connection_manager_bloc/connection_manager_bloc.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_manager/models/sql_statements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QuerySubjectScreen extends StatefulWidget {
  const QuerySubjectScreen({super.key});

  @override
  State<QuerySubjectScreen> createState() => _QuerySubjectScreenState();
}

class _QuerySubjectScreenState extends State<QuerySubjectScreen> {
  final TextEditingController _serial = TextEditingController();
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    _serial.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }

    controller?.resumeCamera();
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
    return Container(
      height: getScanAreaHeight(context),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: _oldStuff(context),
    );
  }

  Stack _oldStuff(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildScanView(context),
        Positioned(
          bottom: 10,
          child: _buildResult(context),
        ),
        Positioned(
          top: 10,
          child: _buildControlButtons(context),
        ),
      ],
    );
  }

  Widget _buildScanView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 350 ||
            MediaQuery.of(context).size.height < 350)
        ? 150.0
        : 300.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: QRView(
        key: qrKey,
        onQRViewCreated: (controller) => onQRViewCreated(context, controller),
        overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).colorScheme.secondary,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea,
        ),
      ),
    );
  }

  Widget _buildControlButtons(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {});
            },
            icon: FutureBuilder<bool?>(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(
                    (snapshot.data!) ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          IconButton(
            onPressed: () async {
              await controller?.flipCamera();
              setState(() {});
            },
            icon: FutureBuilder<CameraFacing?>(
              future: controller?.getCameraInfo(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return const Icon(
                    Icons.switch_camera,
                    color: Colors.white,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        barcode != null ? 'Result: ${barcode?.code ?? ''}' : 'Scan a code',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
        maxLines: 3,
      ),
    );
  }

  void onQRViewCreated(BuildContext context, QRViewController controller) {
    print('🔥 🔥 onQRViewCreated');
    setState(() {
      this.controller = controller;
    });

    controller.pauseCamera();
    controller.resumeCamera();

    controller.scannedDataStream.listen((barcode) {
      // print('🔥 🔥 ${barcode.code}');
      _handleBarcode(context, barcode);
    });
  }

  void _handleBarcode(BuildContext context, Barcode barcode) {
    print('🔥 🔥 ${barcode.code}');
    // if (barcode.code != null && waitingToGO) {
    //   setState(() {
    //     waitingToGO = false;
    //   });
    if (barcode.code != null) {
      context.read<ConnectionManagerBloc>().add(
          ConnectionManagerExecuteStatment(
              query: SQLStatements.statementForBarcode(barcode.code!)));
      Navigator.of(context).pushNamed(AppScreens.subjectDetailsScreen);
    }
  }

  Widget _executeButton(BuildContext context) {
    return GradientButton(
      label: Translator.translation(context).ok_button,
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_serial.text.isNotEmpty) {
          context.read<ConnectionManagerBloc>().add(
              ConnectionManagerExecuteStatment(
                  query: SQLStatements.statementForSerial(_serial.text)));
          return Navigator.of(context)
              .pushNamed(AppScreens.subjectDetailsScreen);
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
}
