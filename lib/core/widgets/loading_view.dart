//

import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : const SizedBox.shrink();
  }
}
