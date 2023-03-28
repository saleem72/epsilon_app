//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/utils/styling/assets/app_icons.dart';
import 'package:epsilon_app/core/widgets/app_nav_bar.dart';
import 'package:epsilon_app/core/widgets/loading_view.dart';
import 'package:epsilon_app/features/core/home_screen/domain/models/product_datails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/styling/colors/app_colors.dart';
import '../../../core/utils/styling/topology/topology.dart';
import '../../../core/widgets/labeled_text.dart';
import '../home_screen/presentation/connection_manager/connection_manager_bloc/connection_manager_bloc.dart';

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:
                    BlocBuilder<ConnectionManagerBloc, ConnectionManagerState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        state is ConnectionManagerLoading
                            ? const SingleChildScrollView(
                                child: EmptyProductCard(),
                              )
                            : const SizedBox.shrink(),
                        state is ConnectionManagerLoading
                            ? const LoadingView(
                                isLoading: true,
                                color: AppColors.primaryDark,
                              )
                            : const SizedBox.shrink(),
                        state is ConnectionManagerSuccess
                            ? _buildProductCard(context, state.records)
                            : const SizedBox.shrink(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, List<Map<String, String>> recoreds) {
    final materials = recoreds.map((e) => ProductDetails.fromMap(e)).toList();

    return materials.isNotEmpty
        ? ProductCard(product: materials.first)
        : const SizedBox.shrink();
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductDetails product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        LabeledText(
          text: product.code,
          label: Translator.translation(context).subject_id,
          icon: AppIcons.subjectId,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: product.name,
          label: Translator.translation(context).subject_name,
          icon: AppIcons.subjectName,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: product.barcode,
          label: Translator.translation(context).serial_number,
          icon: AppIcons.serialNumber,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: product.matunit,
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
                  product.enduser,
                  style: Topology.subTitle,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.enduser2),
              ),
            ),
            const TableCell(
              child: Text(' '),
            ),
          ],
        ),
      ],
    );
  }
}

class EmptyProductCard extends StatelessWidget {
  const EmptyProductCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        LabeledText(
          text: "",
          label: Translator.translation(context).subject_id,
          icon: AppIcons.subjectId,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: "",
          label: Translator.translation(context).subject_name,
          icon: AppIcons.subjectName,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: "",
          label: Translator.translation(context).serial_number,
          icon: AppIcons.serialNumber,
        ),
        const SizedBox(height: 16),
        LabeledText(
          text: "",
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
