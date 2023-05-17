import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

class MyApp extends StatelessWidget {
  // Sample product data
  final List<Product> products = [
    Product(id: 1, name: 'Product 1', price: 10.0),
    Product(id: 2, name: 'Product 2', price: 15.0),
    Product(id: 3, name: 'Product 3', price: 20.0),
  ];

  // Cart list to store added products
  final List<Product> cart = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add to Cart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add to Cart Example'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('Price: \$${product.price}'),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  addToCart(product);
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            // Navigate to the cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
            );
          },
        ),
      ),
    );
  }

  // Function to add a product to the cart
  void addToCart(Product product) {
    cart.add(product);
  }
}

class CartScreen extends StatelessWidget {
  final List<Product> cart;

  const CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          final product = cart[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: \$${product.price}'),
          );
        },
      ),
    );
  }
}