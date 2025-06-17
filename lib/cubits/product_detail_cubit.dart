import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_basic/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_basic/cubits/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  Future<void> fetchProduct(int productId) async {
    emit(ProductDetailLoading());
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/$productId'),
      );
      if (response.statusCode == 200) {
        final product = Product.fromJson(json.decode(response.body));
        emit(ProductDetailLoaded(product));
      } else {
        emit(ProductDetailError('Failed to load product'));
      }
    } catch (e) {
      emit(ProductDetailError('Error: ${e.toString()}'));
    }
  }
}
