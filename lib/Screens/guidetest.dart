// ignore_for_file: file_names, non_constant_identifier_names, unused_import, constant_identifier_names, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:hugom/util/database.dart';

import '../model/guidemodel.dart';
import '../util/AppColors.dart';

const List<Map<String, dynamic>> PlaceData = [
  {"name": "Step 1", "x": 18, "y": 16, "title": "Miqat", "desc": "Niyyat for Umrah"},
  {"name": "Step 2", "x": 150, "y": 30, "title": "Ihram for Umrah", "desc": ""},
  {"name": "Step 3", "x": 245, "y": 10, "title": "Tawaf", "desc": ""},
  {"name": "Step 4", "x": 320, "y": 30, "title": "Sai", "desc": ""},
  {"name": "Step 5", "x": 330, "y": 100, "title": "Ihram for Hajj", "desc": ""},
  {"name": "Step 6", "x": 250, "y": 125, "title": "Mabit in Mina", "desc": ""},
  {"name": "Step 7", "x": 150, "y": 110, "title": "Wukuf in Arafah", "desc": ""},
  {"name": "Step 8", "x": 20, "y": 120, "title": "Mabit in Muzdalfah", "desc": ""},
  {"name": "Step 9", "x": 20, "y": 208, "title": "Jamarats Aqabah", "desc": ""},
  {"name": "Step 10", "x": 105, "y": 205, "title": "Tahallul", "desc": ""},
  {"name": "Step 11", "x": 200, "y": 202, "title": "Tawaf Ifadah", "desc": ""},
  {"name": "Step 12", "x": 300, "y": 230, "title": "Sai", "desc": ""},
  {"name": "Step 13", "x": 320, "y": 313, "title": "Mabit in Mina", "desc": ""},
  {"name": "Step 14", "x": 175, "y": 287, "title": "Jamarat", "desc": ""},
  {"name": "Step 15", "x": 20, "y": 290, "title": "Tawaf Wida", "desc": ""},
  // Add more places as needed
];

class gs extends StatefulWidget {
  @override
  State<gs> createState() => _gsState();
}

class _gsState extends State<gs> {
  List<guide> ddlist = [];
  final AudioPlayer player = AudioPlayer();
  String selectedPlaceTitle = '';
    String selectedPlaceDesc = '';
  void fetchDuas() async {
    // Fetch list of groups from the database and assign it to ddlist
    ddlist = await db.instance.getDuas();
    setState(() {});
  }
TextStyle shadedTextStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

Container shadedTextContainer(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.7),
      borderRadius: BorderRadius.circular(10),
      
    ),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
     width: 500,
    child: Text(
      text,
      style: shadedTextStyle,
       textAlign: TextAlign.center,
    ),
  );
}


  Widget renderPlaceMarkers() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/gj.jpg',
          fit: BoxFit.cover,
        ),
        ...PlaceData.map((place) {
          return Positioned(
            left: place['x'].toDouble(),
            top: place['y'].toDouble(),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlaceTitle = place['title'];
                  selectedPlaceDesc  = place['desc'];
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  place['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    fetchDuas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text(
                'GUIDE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            renderPlaceMarkers(),
            const SizedBox(height: 10),
             shadedTextContainer( selectedPlaceTitle),
              const SizedBox(height: 5),
               shadedTextContainer( selectedPlaceDesc),
              
             const SizedBox(height: 10),
           
           
          
          ],
        ),
      ),
    );
  }
}
