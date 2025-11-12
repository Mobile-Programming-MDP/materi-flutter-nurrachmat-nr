import 'package:flutter/material.dart';
import 'package:wisata_candi/screens/favorite_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //@Todo 1 : Buat state
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(), //0
    SearchScreen(), //1
    FavoriteScreen(), //2
    ProfileScreen(), //3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //@Todo 2 : but prop body menampilkan widget berdasarkan state
      body: _children[_currentIndex],
      //@Todo 3 : bottomNavigationBar
      bottomNavigationBar: Theme(
        //@Todo 4 : buat data dan child dari Theme (menampilkan icon menu)
        data: Theme.of(context).copyWith(canvasColor: Colors.deepPurple[50]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple), //Item 1
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple), //Item 2
              label: "Search"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple), //Item 3
              label: "Favorite"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.deepPurple), //Item 4
              label: "Profile"
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[300],
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
