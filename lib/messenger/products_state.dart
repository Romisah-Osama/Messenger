part of 'products_cubit.dart';

@immutable
sealed class ProductsState {

}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final Products productsModel;

  ProductsSuccess(this.productsModel);
}

final class ProductsError extends ProductsState {
  final String errorMessage;

  ProductsError(this.errorMessage);
}