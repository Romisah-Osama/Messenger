import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/messenger/products.dart';


import 'API_provider.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    getProductsFromCubit();
  }

  static ProductsCubit get(context) => BlocProvider.of<ProductsCubit>(context);

  Products? productModel;

  Future<void> getProductsFromCubit() async {
    try {
      emit(ProductsLoading());
      productModel = await ApiProvider().getProducts();
      emit(ProductsSuccess(productModel!));
    } catch (e) {
      print(e.toString());
      emit(ProductsError(e.toString()));
    }
  }
}