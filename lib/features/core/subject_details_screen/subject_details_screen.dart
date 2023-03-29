//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/styling/colors/app_colors.dart';
import '../../../core/widgets/app_nav_bar.dart';
import '../../../core/widgets/loading_view.dart';
import 'models/product_datails.dart';
import '../home_screen/presentation/connection_manager/connection_manager_bloc/connection_manager_bloc.dart';
import 'presentation/widgets/product_card.dart';

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
                        state is GettingProductWithSuccess
                            ? const SizedBox.shrink()
                            : const SingleChildScrollView(
                                child: ProductCard(),
                              ),
                        state is ConnectionManagerLoading
                            ? const LoadingView(
                                isLoading: true,
                                color: AppColors.primaryDark,
                              )
                            : const SizedBox.shrink(),
                        state is ConnectionManagerExecutionFailure
                            ? ErrorView(
                                onAction: () => context
                                    .read<ConnectionManagerBloc>()
                                    .add(ConnetionManagerClearError()),
                                failure: state.failure,
                              )
                            : const SizedBox.shrink(),
                        state is GettingProductWithSuccess
                            ? _buildProductCard(context, state.product)
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

  Widget _buildProductCard(BuildContext context, ProductDetails product) {
    return ProductCard(product: product);
  }
}
