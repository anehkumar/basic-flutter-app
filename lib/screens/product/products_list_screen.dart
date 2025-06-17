import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/product_cubit.dart';
import '../../cubits/product_state.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';
import '../../widgets/product_card.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          }
          if (state.products == null || state.products!.isEmpty) {
            return const Center(child: Text('No products found'));
          }
          return ListView.builder(
            itemCount: state.products!.length,
            itemBuilder: (context, index) {
              final product = state.products![index];
              return ProductCard(product: product);
            },
          );
        },
      ),
    );
  }
}
