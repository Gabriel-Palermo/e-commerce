import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/product.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Pincel do alanzoka', price: 8.0),
    Product(name: 'Sapo que vira principe', price: 30.0),
    Product(name: 'Camiseta do Palmeiras', price: 1.99),
    Product(name: 'Baralho de truco', price: 15.67),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("R\$ ${product.price.toStringAsFixed(2)}"),
            trailing: ElevatedButton(
              child: Text('Adicionar'),
              onPressed: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addItem(product);
              },
            ),
          );
        },
      ),
    );
  }
}
