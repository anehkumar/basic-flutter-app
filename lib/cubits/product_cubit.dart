import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState(isLoading: true)) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      if (response.statusCode == 200) {
        final List<Product> products = (json.decode(response.body) as List)
            .map((item) => Product.fromJson(item))
            .toList();
        emit(state.copyWith(products: products, isLoading: false));
      } else {
        emit(
          state.copyWith(error: 'Failed to load products', isLoading: false),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
