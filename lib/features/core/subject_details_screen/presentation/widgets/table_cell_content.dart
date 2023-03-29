//

import 'package:flutter/material.dart';

import '../../../../../core/utils/styling/colors/app_colors.dart';
import '../../../../../core/utils/styling/topology/topology.dart';

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
