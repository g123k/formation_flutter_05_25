import 'package:bloc/bloc.dart';
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
      await Future.delayed(const Duration(seconds: 2));
      final Product product = generateProduct();
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
