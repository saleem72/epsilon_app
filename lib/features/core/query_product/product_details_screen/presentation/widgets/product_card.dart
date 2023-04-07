//

import 'package:flutter/material.dart';

import '../../../../../../core/helpers/localization/language_constants.dart';
import '../../../../../../core/utils/styling/assets/app_icons.dart';
import '../../../../../../core/utils/styling/colors/app_colors.dart';
import '../../../../../../core/utils/styling/topology/topology.dart';
import '../../../../../../core/widgets/labeled_text.dart';
import '../../domain/models/product_datails.dart';
import 'table_cell_content.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.product,
  });
  final ProductDetails? product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        LabeledText(
          text: product?.code ?? '',
          label: Translator.translation(context).subject_id,
          icon: AppIcons.subjectId,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: product?.name ?? '',
          label: Translator.translation(context).subject_name,
          icon: AppIcons.subjectName,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: product?.barcode ?? '',
          label: Translator.translation(context).serial_number,
          icon: AppIcons.serialNumber,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: product?.matunit ?? '',
          label: Translator.translation(context).subject_properties,
          icon: AppIcons.properties,
        ),
        const SizedBox(height: 16),
        _table(context),
        const SizedBox(height: 16),
      ],
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
        TableRow(
          // decoration: const BoxDecoration(
          //   color: Colors.grey,
          // ),
          children: <Widget>[
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product?.enduser ?? '',
                  style: Topology.subTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product?.enduser2 ?? '',
                  style: Topology.subTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Text(
                product?.storeName ?? '',
                style: Topology.subTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
