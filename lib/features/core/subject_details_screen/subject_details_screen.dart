//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/utils/styling/assets/app_icons.dart';
import 'package:epsilon_app/core/widgets/app_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/styling/colors/app_colors.dart';
import '../../../core/utils/styling/topology/topology.dart';
import '../../../core/widgets/labeled_text.dart';

class SubjectDetailsScreen extends StatelessWidget {
  const SubjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavBar(
              title: Translator.translation(context).query_subject_screen),
          const SizedBox(height: 16),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.image,
              size: 80,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    LabeledText(
                      text: "001",
                      label: Translator.translation(context).subject_id,
                      icon: AppIcons.subjectId,
                    ),
                    const SizedBox(height: 16),
                    LabeledText(
                      text: "صابون",
                      label: Translator.translation(context).subject_name,
                      icon: AppIcons.subjectName,
                    ),
                    const SizedBox(height: 16),
                    LabeledText(
                      text: "120-765",
                      label: Translator.translation(context).serial_number,
                      icon: AppIcons.serialNumber,
                    ),
                    const SizedBox(height: 16),
                    LabeledText(
                      text: "شغلة على الكيف",
                      label: Translator.translation(context).subject_properties,
                      icon: AppIcons.properties,
                    ),
                    const SizedBox(height: 16),
                    _table(context),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _table(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: AppColors.primaryLight,
      ),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(), //IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(), //FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TableCellContent(
                    text: Translator.translation(context).subject_price_one),
              ),
            ),
            TableCell(
              child: TableCellContent(
                  text: Translator.translation(context).subject_price_tow),
            ),
            TableCell(
              child: TableCellContent(
                  text: Translator.translation(context).subject_store),
            ),
          ],
        ),
        const TableRow(
          // decoration: const BoxDecoration(
          //   color: Colors.grey,
          // ),
          children: <Widget>[
            TableCell(
              child: Text(' '),
            ),
            TableCell(
              child: Text(' '),
            ),
            TableCell(
              child: Text(' '),
            ),
          ],
        ),
      ],
    );
  }
}

class TableCellContent extends StatelessWidget {
  const TableCellContent({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Topology.body.copyWith(
            color: AppColors.primaryLight,
          ),
        ),
      ],
    );
  }
}
