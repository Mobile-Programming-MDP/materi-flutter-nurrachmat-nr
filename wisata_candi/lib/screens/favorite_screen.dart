import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  //Todo 1 : Buat variabel untuk menyimpan daftar candi favorit
  List<Candi> _favoriteCandi = [];

  //Todo 2 : Buat fungsi untuk memuat daftar candi favorit dari SP
  Future<void> _loadFavoriteCandi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //Gunakan where untuk memfilter candi yang ditandai favorit
      _favoriteCandi = candiList.where((candi) {
        var status = prefs.getBool('favorite_${candi.name}') ?? false;
        print('Apakah ${candi.name} ada di fav? $status');
        return prefs.getBool('favorite_${candi.name}') ?? false;
      }).toList();
      print(_favoriteCandi.length);
    });
  }

  //Todo 3 : Panggil fungsi _loadFavoriteCandi di initState
  @override
  void initState() {
    super.initState();
    _loadFavoriteCandi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Candi Favorite')),
      body: ListView.builder(
        itemCount: _favoriteCandi.length,
        itemBuilder: (context, index) {
          final candi = _favoriteCandi[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(candi: candi),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(candi.imageAsset, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          candi.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(candi.location),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
