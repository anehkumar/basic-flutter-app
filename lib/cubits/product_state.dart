import '../models/product.dart';

class ProductState {
  final List<Product>? products;
  final bool isLoading;
  final String? error;

  const ProductState({this.products, this.isLoading = false, this.error});

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
