import 'package:flutter_search_package/flutter_search_package.dart';
import 'package:flutter_test/flutter_test.dart';

class Product {
  final String name;
  final String description;

  Product(this.name, this.description);
}

void main() {
  group('SearchHelper', () {
    test('search returns matching products', () {
      List<Product> products = [
        Product('Laptop', 'A portable computer'),
        Product('Phone', 'A mobile device'),
      ];

      List<Product> results = SearchHelper.search(products, (product, query) {
        return product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase());
      }, 'laptop');

      expect(results.length, 1);
      expect(results.first.name, 'Laptop');
    });

    test('search returns empty list when no match', () {
      List<Product> products = [
        Product('Laptop', 'A portable computer'),
        Product('Phone', 'A mobile device'),
      ];

      List<Product> results = SearchHelper.search(products, (product, query) {
        return product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase());
      }, 'tablet');

      expect(results.isEmpty, true);
    });
  });
}
