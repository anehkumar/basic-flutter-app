import 'package:flutter_basic/models/product.dart';

abstract class ProductDetailState {
  const ProductDetailState();
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final Product product;
  const ProductDetailLoaded(this.product);
}

class ProductDetailError extends ProductDetailState {
  final String message;
  const ProductDetailError(this.message);
}
