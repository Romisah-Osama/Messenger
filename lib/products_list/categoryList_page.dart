
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/products_list/productList_page.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<String> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/category-list'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Response data: $data');


        setState(() {
          categories = List<String>.from(data);
          isLoading = false;
        });
      } else {
        print('Failed to load categories. Status code: ${response.statusCode}');
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : categories.isEmpty
          ? Center(child: Text('No categories available'))
          : ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListPage(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}