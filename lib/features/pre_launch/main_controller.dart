//

import 'package:epsilon_app/core/localization/language_constants.dart';
import 'package:flutter/material.dart';

class MainController extends StatelessWidget {
  const MainController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translator.translation(context).app_name),
      ),
      body: Column(),
    );
  }
}
