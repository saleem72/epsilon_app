//

import 'package:epsilon_app/features/core/query_product/product_details_screen/data/repository/product_fetcher_repository.dart';
import 'package:epsilon_app/features/core/query_product/product_details_screen/domain/repository/i_product_fetcher_repository.dart';
import 'package:epsilon_app/features/core/query_product/product_details_screen/domain/usecases/product_details_mapper.dart';
import 'package:epsilon_app/features/core/query_product/product_details_screen/presentation/bloc/product_details_bloc.dart';
import 'package:get_it/get_it.dart';

initProductDetails(GetIt locator) {
  locator.registerFactory(() => ProductDetailsBloc(repository: locator()));

  locator.registerLazySingleton<IProductFetcherRepository>(
    () => ProductFetcherRepository(
      networkInfo: locator(),
      connectionManager: locator(),
      sqlProvider: locator(),
      productDetailsMapper: locator(),
      connectionGetter: locator(),
    ),
  );

  locator.registerLazySingleton(() => ProductDetailsMapper());
}
