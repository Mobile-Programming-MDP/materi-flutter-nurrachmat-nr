import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  //@Todo 1 : deklarasi variable dan konstruktor
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    //@Todo 6 : Navigasi ke Detail Screen

    return InkWell(
      onTap: (){
        Navigator.push(context, 
          // MaterialPageRoute(builder: (context) {
          //   return DetailScreen(candi: candi);
          // })
          MaterialPageRoute(builder: (context) => DetailScreen(candi: candi))
        );
      },
      child: Card(
        //@Todo 2 : implementasi propery Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(4),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //@Todo 3 : Image Widget
            Expanded(
              //@Todo 7 : Hero Animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //@Todo 4 : Text widget (nama candi)
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16),
              child: Text(
                candi.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            //@Todo 5 : Text widget (tipe candi)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16),
              child: Text(
                candi.type,
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
