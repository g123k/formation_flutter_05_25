import 'package:bloc/bloc.dart';
import 'package:untitled4/api/model/product_response.dart';
import 'package:untitled4/api/openfoodfacts_api.dart';
import 'package:untitled4/model/product.dart';

abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {
  final String barcode;

  LoadProductEvent(this.barcode)
    : assert(barcode.isNotEmpty, 'Barcode cannot be empty');
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(String barcode) : super(LoadingProductState()) {
    on<LoadProductEvent>(_onLoadProduct);
    add(LoadProductEvent(barcode));
  }

  Future<void> _onLoadProduct(
    LoadProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const LoadingProductState());
    try {
      final ProductAPIEntity response = await OpenFoodFactsAPIManager()
          .loadProduct(event.barcode);
      final Product product = response.response!.toProduct();
      emit(SuccessProductState(product: product));
    } catch (err) {
      emit(ErrorProductState(error: err));
    }
  }
}

sealed class ProductState {
  const ProductState();
}

class LoadingProductState extends ProductState {
  const LoadingProductState();
}

class SuccessProductState extends ProductState {
  final Product product;

  SuccessProductState({required this.product});
}

class ErrorProductState extends ProductState {
  final dynamic error;

  ErrorProductState({required this.error});
}
