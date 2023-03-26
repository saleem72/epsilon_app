//

import 'package:flutter/material.dart';

import '../utils/styling/assets/assets.dart';

class AppDecorationImage extends StatelessWidget {
  const AppDecorationImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 177.63,
      height: 401.2,
      child: Image(image: AssetImage(Assets.decoration)),
    );
  }
}
