

// ignore_for_file: camel_case_types, use_key_in_widget_constructors, constant_identifier_names, unused_local_variable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


 // ignore: non_constant_identifier_names
 List<Map<String, dynamic>> PlaceData = [
  {"name": "Step 1", "x": 146, "y": 16, "title": "Niyyah & Ihram", "desc": "Recite the Niyyat for Hajj","audio":"assets/audios/Hajj_Niyyat.mp3","audiot":"Niyyat for Hajj","dua":"اَللّٰھُمَّ اِنِّیٓ اُرِیْدُ الْعُمْرَۃَ وَالْحَجَّ فَیَسِّرْھُمَا لِیْ وَتَقَبَّلْہُمَامِنِّی ط نَوَیْتُ الْعُمْرَۃَوَالْحَجَّ وَ اَحْرَمْتُ بِہِِمَامُخْلِصًا لِلّٰہِ تَعَالٰی"},
  {"name": "Step 2", "x": 220, "y": 16, "title": "Stay at Mina", "desc": "Now while reciting Talbiya, go to Mina.Offer Zuhr, Asar, Maghrib, and Isha. and stay here for the night. Offer Fajr and Go to Arafah.","audio":"assets/audios/Talbiyah.mp3","audiot":"Talbiyah","dua":"لبيك اللهُمَّ لَبَّيْكَ لَبَيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ انَ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ لَا شَرِيكَ لَكَ"},
  {"name": "Step 3", "x": 190, "y": 87, "title": "Wukuf in Arafah", "desc": "Offer Zuhr at Maidan e Arafah. Now make the intention of wukuf in Arafah from Zuhr to Maghrib. Also Offer Asar in Maindan e Arafah.Now go to Muzdalfah without offering Namaz e Maghrib. You have to Offer Maghrib and Isha at the time of Isha in Muzdalfah","audio":"assets/audios/Arafah.mp3","audiot":"Arafah","dua":""},
  {"name": "Step 4", "x": 110, "y": 87, "title": "Collect Pebbles", "desc": "You need to collect a total of 49 pebbles to perform Rami over the next three days. The breakdown is as follows:7 for the 10th of Dhul Hijjah.21 for the 11th of Dhul Hijjah.21 for the 12th of Dhul Hijjah.It is advised, however, that you pick up a further 21 pebbles as a precautionary measure to bring your total up to 70. When you’re throwing the pebbles at the Jamarat, you may miss the target or some pebbles may fall from your hand. It’s better to have more than to have less.","audio":"","audiot":"NO AUDIO","dua":""},
  {"name": "Step 5", "x": 120, "y": 160, "title":"Rummi", "desc": "Now one by one through 7 Pebbles at Elder(Big) Satan","audio":"assets/audios/DuaRummi.mp3","audiot":"Dua for Rummi","dua":""},
  {"name": "Step 6", "x": 200, "y": 160, "title": "Sacrifice(Qurbani)", "desc": "Perform Sacrifice(Qurbani)","audio":"","audiot":"Dua for Rummi","dua":""},
  {"name": "Step 7", "x": 280, "y": 160, "title": "Tahallul", "desc": "Once your done with the Qurbani,Trim Your Hairs and go to Tawaf e Zyarat","audio":"","audiot":"No Audio","dua":""},
  {"name": "Step 8", "x": 245, "y": 230, "title": "Tawaf e Zyarat", "desc": "After Niyat start moving, If you get a chance give Bosa to Hajre-Aswad or if it is crowded, face your both hands towards Hajre-Aswad and give bosa with a gesture.Recite this dua while facing Hajre-Aswad and touching your hands to your ears likewise in Takbeer.Now start moving at your right side as the Holy Kaaba is at your left. Peform Ramal for first 3 rounds.Walk quickly with short steps. Moving both your shoulders and tighten the body.Start making any dua you remember.As you start the Tawaf from Hajre-Aswad It will end here after 7 rounds. You can make any dua while the round, As you reach the 3rd corner(Rukne-Yamani) Start the Dua mentioned in the next step till you reach Hajre-Aswad.Now when you see the Green Light, it means you are just infront of Hajre-Aswad and your one round is complete. If you get a chance give Bosa to Hajre-Aswad.Now as you have completed the 7 rounds, make whatever Dua you want to. and offer 2 rakat Wajib-ul-Tawaf near Muqam-e-Ibrahimi.Now face towards the Holy Kaaba and drink Abe Zam Zam as much as you want and make this dua.","audio":"assets/audios/Tawaf Ki Niyat.mp3","audiot":"Tawaf e Ziyarat","dua":""},
  {"name": "Step 9", "x": 160, "y": 230, "title": "Sai", "desc": "Intention for Sai","audio":"assets/audios/SaiNiyat.mp3","audiot":"Sai Niyyat","dua":""},
  {"name": "Step 10", "x": 160, "y": 303, "title": "Rummi", "desc": "Now perform Rummi. Through 7 Pebbles at each Satan, starting from the smaller one then Middle one and the largest one.","audio":"assets/audios/DuaRummi.mp3","audiot":"Dua for Rummi","dua":""},
  {"name": "Step 11", "x": 250, "y": 303, "title": "Tawaf e Wida", "desc": " Intention for Tawaf,After Niyat start moving, If you get a chance give Bosa to Hajre-Aswad or if it is crowded, face your both hands towards Hajre-Aswad and give bosa with a gesture.Recite this dua while facing Hajre-Aswad and touching your hands to your ears likewise in Takbeer.Now start moving at your right side as the Holy Kaaba is at your left. Peform Ramal for first 3 rounds.Walk quickly with short steps. Moving both your shoulders and tighten the body.Start making any dua you remember.As you start the Tawaf from Hajre-Aswad It will end here after 7 rounds. You can make any dua while the round, As you reach the 3rd corner(Rukne-Yamani) Start the Dua mentioned in the next step till you reach Hajre-Aswad","audio":"assets/audios/Tawaf ki Niyyat.mp3","audiot":"Tawaf ki Niyyat","dua":""},

];

class hg extends StatefulWidget {
  @override
  State<hg> createState() => _hgState();
}

class _hgState extends State<hg> {
 
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
          'assets/images/hg.jpg',
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
                    color: Colors.black,
                    fontSize: 14,
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
                  'HAJJ GUIDE',
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
        
        
        
             const SizedBox(height: 10,),
           
            ],
          ),
        ),
      ),
    );
  }
}
