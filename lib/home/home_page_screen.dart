
import 'package:flutter/material.dart';
import '../about/about_app.dart';
import '../about/developers_page.dart';
import '../messenger/messenger_screen.dart';
import '../products_list/categoryList_page.dart';
import '../about/profile_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const LayoutScreen(),
    );
  }
}

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;


  final List<Widget> _pages = [
    MessengerScreen(),
    ProfileScreen(),
    CategoryListPage(),
    DevelopersPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messenger",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_mode),
            label: "Developers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
        ],
      ),
    );
  }
}