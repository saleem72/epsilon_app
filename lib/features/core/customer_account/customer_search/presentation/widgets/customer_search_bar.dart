//

import 'package:epsilon_app/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styling/assets/app_icons.dart';
import '../../../../../../core/utils/styling/colors/app_colors.dart';
import '../../../../../../core/utils/styling/topology/topology.dart';

class CustomerSearchBar extends StatelessWidget {
  const CustomerSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.primaryDark.withOpacity(0.49),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              AppIcons.search,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: Topology.smallTitle.copyWith(
                color: AppColors.primaryDark,
              ),
              decoration: InputDecoration(
                  hintText: context.translate.search,
                  hintStyle: Topology.smallTitle.copyWith(
                    color: AppColors.secondary,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
