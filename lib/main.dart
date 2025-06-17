import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/product_cubit.dart';
import 'screens/product/products_list_screen.dart';
import 'models/product.dart';
import 'screens/product/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: BlocProvider(
        create: (context) => ProductCubit(),
        child: const ProductsListScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
