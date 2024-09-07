import 'package:flutter/material.dart';
import 'package:flutter_search_package/flutter_search_package.dart';

class Product {
  final String name;
  final String description;

  Product(this.name, this.description);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> products = [
    Product('Laptop', 'A portable computer'),
    Product('Phone', 'A mobile device'),
    Product('Tablet', 'A handheld device'),
    // Add more products...
  ];

  List<Product> searchResults = [];

  void searchProducts(String query) {
    setState(() {
      searchResults = SearchHelper.search(products, (product, searchTerm) {
        return product.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
            product.description
                .toLowerCase()
                .contains(searchTerm.toLowerCase());
      }, query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Search Products'),
          onChanged: (query) => searchProducts(query),
        ),
      ),
      body: ListView.builder(
        itemCount:
            searchResults.isEmpty ? products.length : searchResults.length,
        itemBuilder: (context, index) {
          final product =
              searchResults.isEmpty ? products[index] : searchResults[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.description),
          );
        },
      ),
    );
  }
}
