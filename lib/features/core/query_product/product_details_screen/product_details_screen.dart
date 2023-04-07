//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/widgets/error_view.dart';
import 'package:epsilon_app/dependancy_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styling/colors/app_colors.dart';
import '../../../../core/widgets/app_nav_bar.dart';
import '../../../../core/widgets/loading_view.dart';
import 'domain/models/barcode_or_serial.dart';
import 'domain/models/product_datails.dart';
import 'presentation/bloc/product_details_bloc.dart';
import 'presentation/widgets/product_card.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.input,
  });
  final BarcodeOrSerial input;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProductDetailsBloc>()
        ..add(ProductDetailsEvent.getProduct(product: input)),
      child: const ProductDetailsScreenContent(),
    );
  }
}

class ProductDetailsScreenContent extends StatelessWidget {
  const ProductDetailsScreenContent({super.key});

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
                child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        state is ProductDetailsWithSuccess
                            ? const SizedBox.shrink()
                            : const SingleChildScrollView(
                                child: ProductCard(),
                              ),
                        state is ProductDetailsLoading
                            ? const LoadingView(
                                isLoading: true,
                                color: AppColors.primaryDark,
                              )
                            : const SizedBox.shrink(),
                        state is ProductDetailsWithFailure
                            ? GeneralErrorView(
                                onAction: () => context
                                    .read<ProductDetailsBloc>()
                                    .add(
                                        const ProductDetailsEvent.clearError()),
                                failure: state.failure.map(
                                  noInternet: (_) =>
                                      Translator.translation(context)
                                          .no_internet_connection,
                                  connectionFailure: (_) =>
                                      Translator.translation(context)
                                          .connection_failure,
                                  productNotFound: (_) =>
                                      Translator.translation(context)
                                          .product_not_found,
                                  invalidResponse: (_) =>
                                      Translator.translation(context)
                                          .decoding_failure,
                                  unexpected: (_) =>
                                      Translator.translation(context)
                                          .unexpected_failure,
                                ),
                              )
                            : const SizedBox.shrink(),
                        state is ProductDetailsWithSuccess
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
