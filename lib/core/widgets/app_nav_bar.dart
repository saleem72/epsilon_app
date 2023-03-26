//

import 'package:flutter/material.dart';

import '../utils/styling/colors/app_colors.dart';
import '../utils/styling/topology/topology.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.navbar,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 1.5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Topology.smallTitle.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
