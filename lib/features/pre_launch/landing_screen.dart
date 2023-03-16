//

import 'package:flutter/material.dart';

import '../../core/styling/assets/assets.dart';
import '../../core/styling/colors/app_colors.dart';
import '../../core/styling/topology/topology.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage(Assets.background),
            fit: BoxFit.cover,
          ),
          const Center(
            // 246 × 247 219 × 220
            child: SizedBox(
              width: 219,
              height: 220,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(Assets.splashScreen),
              ),
            ),
          ),
          Center(
            // 246 × 247 219 × 220
            child: Transform.translate(
              offset: const Offset(0, 230),
              child: SizedBox(
                width: 219,
                height: 220,
                child: Column(
                  children: [
                    Text(
                      'Epsilon soft',
                      style: Topology.title.copyWith(
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('for',
                        style: Topology.title.copyWith(
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryDark,
                        )),
                    const SizedBox(height: 20),
                    Text('Business Solutious',
                        style: Topology.title.copyWith(
                          color: AppColors.primaryDark,
                        ))
                  ],
                ),
                // child: ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
