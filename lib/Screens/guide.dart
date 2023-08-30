// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hugom/util/AppColors.dart';



// class GuideScreen extends StatefulWidget {
//   const GuideScreen({Key? key}) : super(key: key);

//   @override
//   State<GuideScreen> createState() => _GuideScreenState();
  
// }

// class _GuideScreenState extends State<GuideScreen> {

// // ignore: non_constant_identifier_names
// Widget Tstyles({text,Fsize,bold,color,Textside}){
//   return
//     Text(text,style: TextStyle(fontSize: Fsize,fontWeight: bold,color: color,),textAlign: Textside,);

// }
//   //lists abouts the duas
//   List duas =[
//     ' بِسْمِ اللهِ، تَوَكَّلْـتُ عَلى اللهِ وَلا حَوْلَ وَلا قُـوَّةَ إِلاّ بِالله',

//     ' اللَّهُمَّ إِنِّيْ أُرِيْدُ الْعُمْرَةَ فَيَسِّرْهَا لِيْ وَتَقَبَّلْهَا مِنِّيْ',

//     'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ لَبَّيْكَ لاَ شَرِيكَ لَكَ لَبَّيْكَ '
//         'إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ لاَ شَرِيكَ لَكَْ',

//     ' اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَْ',

//     ' اللَّهُمَّ زِدْ هَذَا البَيْتَ تَشْريفًا وَتَعْظِيمًا وَتَكْرِيمًا وَمَهَابَةً،وَزِدْ مِن شَرَّفَهُ وكَرمَهُ مِمَّنْ حَجَّه أو اعْتَمَرَه تَشْرِيفًا وَتَكْرِيمًا وَتَعْظِيمًا وَبِرًّا ',



//     'اللَّهُمَّ أعِنَّيْ عَلَى ذِكْرِكَ، وَشُكْرِكَ، وَحُسْنِ عِبَادَتِكَْ',

//     'اللّهُمّ إيْمَاناً بِكَ، وَتَصْدِيْقاً بِكِتَابِكَ وَسُنّةِ نَبِيِّكَ صَلَّى اللهُ عَلَيْهِ وَسَلَّمََْ',

//     'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارَِْ',

//     'اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًاَْ',


// 'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ بِيَدِهِ الْخَيْرُ يُحْيِي وَيُمِيتُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِير',
//     'قَبِلَ اللهُ حَجَّكَ وَكَفَّرَ ذَنْبَكَ وَأَخْلَفَ نَفَقَتَكََْ',

//     'اَللهُمَّ هَذَا حَرَمُ نَبِيِّكَ فَاجْعَلْهُ وِقَايَةً لِيْ مِنَ النَّارِ وَآمِنَّا مِنْ الْعَذَابِ وَسُوْءِ الْحِسَابََِِْ',

//     'آيِبُونَ تَائِبُونَ عَابِدُونَ لِرَبِّنَا حَامِدُونَ',




//    // 'May Allah have mercy on us and protect us '
//      //   'from any pain and suffering ',





//   ];
//   // ignore: non_constant_identifier_names
//   List DuasDetalis=[

//    'Dua for Leaving Home ',
//    'Dua before Entering Ihram ',
//    'Dua The Talbiyah ',
//    'Dua when Entering the Masjid ',
//    'Dua when Seeing the Kaabah ',
//    'Dua after Every Prayer ',
//    'Dua when Beginning Tawaf',
//    'Dua Between the Yemeni Corner and the Black Stone',
//    'Dua when Drinking Zamzam',
//    'Dua during Arafah',
//    'Dua when Greeting other Pilgrims',
//    'Dua when Entering Madinah',
//    'Dua when Returning Home',

//   ];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  backgroundColor: Colors.cyanAccent,
//         body:
        
//         SafeArea(
//           child: Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image:  AssetImage("assets/images/bg.png"),
//                   fit: BoxFit.cover,
//                 )
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Center(
//                   child: Text('Duas',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30.sp,
//                         fontWeight: FontWeight.w700,
//                       )),
//                 ),
//                 SizedBox(
//                   height: 15.h,

//                 ),
//                 SizedBox(
//                   height: 580.h,
//                   child: ListView.builder(

//                       itemCount: DuasDetalis.length,
//                       itemBuilder: (context, int index) {
//                         return Padding(
//                           padding: EdgeInsets.symmetric(vertical: 12.h),
//                           child: Container(


//                             width: 350.w,
//                             decoration:  BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(5.r)),
//                                 color: AppColors.witheColor,



//                             ),
//                             child: Column(

//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [


//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0,bottom: 5),
//                                   child: ListTile(


//                                     title: Tstyles(text:DuasDetalis[index],Fsize: 12.sp,bold: FontWeight.bold,),
//                                     subtitle:Tstyles(text:duas[index],Fsize: 12.sp,bold: FontWeight.bold,Textside: TextAlign.center) ,


//                                     leading:   Container(
//                                             height: 64.h,
//                                             width: 58.w,

//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.all(Radius.circular(5.r)),
//                                           color: AppColors.btn2_Color,
//                                         ),
//                                         child: Center(child: Tstyles(text:" ${index+1} Dua",Fsize: 16.sp,bold: FontWeight.bold,color: AppColors.witheColor,Textside: TextAlign.center)))  ,


//                                   ),
//                                 ),
//                               ],
//                             ),


//                           ),
//                         );
//                       }),
//                 ),

//               ],
//             ),
//           ),
//         )


//     );
//   }
// }


