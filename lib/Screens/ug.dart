
// ignore_for_file: use_key_in_widget_constructors, camel_case_types, constant_identifier_names, unused_local_variable

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



const List<Map<String, dynamic>> PlaceData = [
  {"name": "Step 1", "x": 110, "y":50, "title": "Ihram", "desc": "Niyyat for Umrah","audio":"assets/audios/Niyyah_Umrah.mp3","audiot":"Niyyat for Umrah","dua":"bismillah"},
  {"name": "Step 2", "x": 215, "y": 50, "title": "Tawaf e Zyarat", "desc": "After Niyat start moving, If you get a chance give Bosa to Hajre-Aswad or if it is crowded, face your both hands towards Hajre-Aswad and give bosa with a gesture.Recite this dua while facing Hajre-Aswad and touching your hands to your ears likewise in Takbeer.Now start moving at your right side as the Holy Kaaba is at your left. Peform Ramal for first 3 rounds.Walk quickly with short steps. Moving both your shoulders and tighten the body.Start making any dua you remember.As you start the Tawaf from Hajre-Aswad It will end here after 7 rounds. You can make any dua while the round, As you reach the 3rd corner(Rukne-Yamani) Start the Dua mentioned in the next step till you reach Hajre-Aswad.Now when you see the Green Light, it means you are just infront of Hajre-Aswad and your one round is complete. If you get a chance give Bosa to Hajre-Aswad.Now as you have completed the 7 rounds, make whatever Dua you want to. and offer 2 rakat Wajib-ul-Tawaf near Muqam-e-Ibrahimi.Now face towards the Holy Kaaba and drink Abe Zam Zam as much as you want and make this dua.","audio":"assets/audios/Tawaf Ki Niyat.mp3","audiot":"Tawaf e Ziyarat","dua":""},
  {"name": "Step 3", "x": 110, "y": 160, "title": "Sai", "desc": "Intention for Sai","audio":"assets/audios/SaiNiyat.mp3","audiot":"Sai Niyyat","dua":""},
  {"name": "Step 4", "x": 200, "y": 160,  "title": "Tahallul", "desc": "Once your done with the Qurbani,Trim Your Hairs and go to Tawaf e Zyarat","audio":"","audiot":"No Audio","dua":""},
 

  // Add more places as needed
];

class ug extends StatefulWidget {
  @override
  State<ug> createState() => _ugState();
}

class _ugState extends State<ug> {
 
final AudioPlayer player = AudioPlayer();
  String selectedPlaceTitle = '';
    String selectedPlaceDesc = '';
 String selectedPlaceAudioPath = '';
   String selectedPlaceAudioTitle = '';
 String selectedPlaceDua = '';

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

   
    AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playAudio(String audioPath) async {
      String audioasset = audioPath;
                    ByteData bytes = await rootBundle.load(audioasset); // Load sound from assets
                    Uint8List soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                    int result = await player.playBytes(soundbytes);
  }

  Widget renderPlaceMarkers() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/ug.jpg',
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
                      selectedPlaceAudioPath = place['audio'];
                       selectedPlaceAudioTitle=place['audiot'];
                  selectedPlaceDua=place['dua'];
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Text(
                  place['name'],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
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
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'UMRAH GUIDE',
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
             
            Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: GestureDetector(
                    child: Container(
                      height: 64,
                      width: 58,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.green,
                      ),
                      child: const Center(child: Icon(Icons.play_arrow)),
                    ),
                    onTap: () async {
                        playAudio(selectedPlaceAudioPath);
                    },
                  ),
                  title: Text(selectedPlaceAudioTitle),
                  subtitle: Text(selectedPlaceDua),
                  trailing: GestureDetector(
                    child: Container(
                      height: 64,
                      width: 58,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.red,
                      ),
                      child: const Center(child: Icon(Icons.stop)),
                    ),
                    onTap: () async {
                      int result = await player.stop();
        
                      // You can pause the player
                      // int result = await player.pause();
        
                      if (result == 1) {
                        // Stop success
                        if (kDebugMode) {
                          print("Sound playing stopped successfully.");
                        }
                      } else {
                        if (kDebugMode) {
                          print("Error while stopping sound.");
                        }
                      }
                    },
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
