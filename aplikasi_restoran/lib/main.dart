import 'package:aplikasi_restoran/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/menu_page.dart';
import 'screens/about_page.dart';
import 'models/food_item.dart';
import 'data/foodlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Restoran',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
      },
      // gunakan onGenerateRoute untuk rute yang membutuhkan argumen (halaman detail)
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final item = settings.arguments as FoodItem?;
          return MaterialPageRoute(
            builder: (context) => DetailPage(item: item),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  final List<FoodItem> _menu = foodList;

  void _openDetail(FoodItem item) {
    Navigator.pushNamed(context, '/detail', arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(),
      MenuPage(menu: _menu, onItemTap: _openDetail),
      const AboutPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Restoran'),
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}