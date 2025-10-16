import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //@TODO : Detail Header
          Stack(
            children: [
              //image utama
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              //custom back button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32,),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100]?.withValues(alpha: 0.8),
                    shape: BoxShape.circle
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))),
              )
            ],
          ),
          //@TODO : Detail Info
      
          //@TODO : Detail Gallery
        ],
      ),
    );
  }
}