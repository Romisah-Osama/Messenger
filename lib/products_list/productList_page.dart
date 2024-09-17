import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  final String category;

  ProductListPage({required this.category});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/category/${widget.category}'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body)['products'];
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Products'),
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['title']),
            subtitle: Text('Price: \$${products[index]['price']}'),
          );
        },
      ),
    );
  }
}