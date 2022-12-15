// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopi_ui/util/kopi_tile.dart';
import 'package:kopi_ui/util/tipe_kopi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list kopiTipe
  final List kopiTipe = [
    // [kopiTipe, isSelected]
    [
      'Cappucino',
      true,
    ],
    [
      'Black',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  // onTap di kopi tipe list
  void kopiTipeSelected(int index) {
    setState(() {
      // loping untuk tombol bersifat false semua
      for (int i = 0; i < kopiTipe.length; i++) {
        kopiTipe[i][1] = false;
      }
      kopiTipe[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Home"),
      ]),
      body: Column(
        children: [
          // rekomendasi kopi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          SizedBox(height: 25),
          // pencarian
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  )),
            ),
          ),

          SizedBox(height: 25),

          // tipe kopi list
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kopiTipe.length,
                itemBuilder: ((context, index) {
                  return KopiTipe(
                    kopiTipe: kopiTipe[index][0],
                    isSelected: kopiTipe[index][1],
                    onTap: () {
                      kopiTipeSelected(index);
                    },
                  );
                })),
          ),

          // kopi list
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              KopiTile(
                kopiImgPath: 'lib/img/latte.jpg',
                kopiNama: 'Latte',
                kopiHarga: '16.000',
              ),
              KopiTile(
                kopiImgPath: 'lib/img/coffee.jpg',
                kopiNama: 'Coffee',
                kopiHarga: '25.000',
              ),
              KopiTile(
                kopiImgPath: 'lib/img/milk.jpg',
                kopiNama: 'Milk',
                kopiHarga: '20.000',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
