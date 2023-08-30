// ignore_for_file: prefer_is_empty, unnecessary_null_comparison

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';


import '../model/admincred.dart';
import '../model/contactmodel.dart';
import '../model/groupmodel.dart';
import '../model/guidemodel.dart';


// ignore: camel_case_types
class db{
  // DB access and creation
  static Database? _database;
  db._privateConstructor();
  static db instance = db._privateConstructor();
  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await _initDB('HUGOM.db');
    return _database;
  }
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  Future _createDB(Database db,int version) async {
    String query1= 'create table $Groups(${GMFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,${GMFields.Group_Name} TEXT,${GMFields.Group_Description} TEXT, ${GMFields.Admin_num} TEXT,${GMFields.Admin_name} TEXT)';
      if (kDebugMode) {
        print('Query $query1');
      }
       String query2= 'create table $Contacts(${CntFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,${CntFields.fname} TEXT,${CntFields.lname} TEXT,${CntFields.phoneno} TEXT,${CntFields.fkgid} INTEGER)';
      if (kDebugMode) {
        print('Query $query2');
      }
      String query3='create table $Guide(${guideFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,${guideFields.Title} TEXT,${guideFields.Dua} TEXT,${guideFields.Audiopath} TEXT,${guideFields.Step} TEXT)';
     if (kDebugMode) {
        print('Query $query3');
      }
        String query4='create table $AdminTable(${AMFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,${AMFields.aname} TEXT,${AMFields.anum} TEXT)';
     if (kDebugMode) {
        print('Query $query4');
      }
    await db.execute(
      query1
    );
      await db.execute(
      query2
    );
    await db.execute(
      query3
    );
     await db.execute(
      query4
    );
   List<Map<String, dynamic>> dataList = [
    {'Title': 'Niyyah for Hajj', 'Dua': 'اَللّٰھُمَّ اِنِّیٓ اُرِیْدُ الْعُمْرَۃَ وَالْحَجَّ فَیَسِّرْھُمَا لِیْ وَتَقَبَّلْہُمَامِنِّی ط نَوَیْتُ الْعُمْرَۃَوَالْحَجَّ وَ اَحْرَمْتُ بِہِِمَامُخْلِصًا لِلّٰہِ تَعَالٰی', 'Audiopath': 'assets/audios/Hajj_Niyyat.mp3','Step': 'Step_5'},
    {'Title': 'Niyyah for Umrah', 'Dua': 'اللَّهُمَّ إِنِّيْ أُرِيْدُ الْعُمْرَةَ فَيَسِّرْهَا لِيْ وَتَقَبَّلْهَا مِنِّيْ', 'Audiopath': 'assets/audios/Niyyah_Umrah.mp3','Step': 'Step_1'},
    {'Title': 'Talbiyah', 'Dua':'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ ، إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ ، لَا شَرِيكَ لَكَ','Audiopath': 'assets/audios/Talbiyah.mp3','Step': 'Step_3,Step_11,Step_15'},
    {'Title': 'Tawaf ki Niyyat', 'Dua': 'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ وَلَا إِلَهَ إِلَّا اللَّهُ وَاللَّهُ أَكْبَرُ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ', 'Audiopath': 'assets/audios/Tawaf.mp3','Step': 'Step3,Step_11,Step_15'},
    {'Title': 'Tawaf', 'Dua': 'سْمِ اللَّهِ وَاللّٰهُ أَكْبَرُ، اللَّهُمَّ إِيْمَاناً بِكَ وَتَصْدِيْقاً بِكِتَابِكَ، وَوَفَاءً بِعَهْدِكَ، وَاتِّبَاعاً لِسُنَّةِ نَبِيِّكَ مُحَمَّدْ', 'Audiopath': 'assets/audios/Tawaf.mp3','Step': 'Step_3,Step_11,Step_15'},
    {'Title': 'Dua Hijre Aswad', 'Dua': 'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ وَلَا إِلَهَ إِلَّا اللَّهُ وَاللَّهُ أَكْبَرُ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ', 'Audiopath': 'assets/audios/DuaHJ-Aswad.mp3','Step': 'Step_3,Step_11,Step_15'},
    {'Title': 'Dua at Rukny Amani', 'Dua': 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ', 'Audiopath': 'assets/audios/Duaatruknyamani.mp3','Step': 'Step_3,Step_11,Step_15'},
    {'Title': 'Dua for Abe Zam Zam', 'Dua': 'اَللّٰھُمَّ اِنِّیْ ٓ اَسْئَلُکَ عِلْـــمًا نَّافِعًا وَّ رِزْقًا وَّاسِعًاوَّعَمَلاً مُتَقَبَّلاً وَّشِفَآئً مِّنْ کُلِّ دَ  آئٍ','Audiopath': 'assets/audios/DuaAbeZamZam.mp3','Step': 'Step_4'},
    {'Title': 'Niyyat for Sai', 'Dua': 'اَللّٰـھُمَّ اِنِّیْ ٓ اُرِیْدُ السَّعْیَ بَیْنَ الصَّفَا وَالْمَرْوَۃِ سَبْعَۃَ اَشْوَاطٍ لِّوَجْھِکَ الْکَرِیْمِ فَیَسِّرْہُ لِیْ وَ تَقَــــبَّـــــلْــــــہُ مِنِّیْ', 'Audiopath': 'assets/audios/SaiNiyat.mp3','Step': 'Step_4'},
    {'Title': 'Safa Marwah', 'Dua': '  اَللّٰہُ اَکْبَرُط اَللّٰہُ اَکْبَرُط اللّٰہُ اَکْبَرُط وَلِلّٰہِ الْحَمْدُط اَلْحَمْدُ لِلّٰہِ عَلٰی مَا ھَدَانَا ط اَلْحَمْدُ لِلّٰہِ عَلٰی مَآ اَوْلَانَا ط اَلْحَمْدُ لِلّٰہِ عَلٰی مَآ اَلْھَمَنَا ط اَلْحَمْدُ لِلّٰہِ الَّذِیْ ھَدَانَا لِھٰذَا وَمَاکُنَّا لِنَھْتَدِیَ لَوْلَآ اَنْ ھَدَانَا اللّٰہُ ط لَآ اِلٰہَ اِلَّا اللّٰہُ وَحْدَہ لَاشَرِیْکَ لَہ ط لَہُ الْمُلْکُ وَلَہُ الْحَمْدُ یُحْیِیْ وَیُمِیْتُ وَھُوَحَیُّ لَّایَمُوْتُ بِیَدِہِ  الْخَیْرُط وَھُوَعلٰی کُلِّ شَیْئٍ قَدِیْرٌ ط لَآ اِلٰہَ اِلَّا اللّٰہُ وَحْدَہ وَصَدَقَ وَعْدَہ  وَنَصَرَ عَبْدَہ وَاَعَزَّ جُنْدَہ وَھَزَمَ الْاَحْزَابَ وَحْدَہ ط لَآ اِلٰہَ  اِلَّا اللّٰہُ وَلَا نَعْبُدُ  اِلَّا اِیَّاہُ مُخْلِصِیْنَ لَہُ الدِّیْنَ وَلَوْکَرِہَ الْکَافِرُوْنَ ط اَللّٰھُمَّ اِنَّکَ قُلْتَ وَقَوْلُکَ  الْحَقُّ اُدْعُوْنِیْ اَسْتَجِبْ لَکُمْ وَاِنَّکَ لَا تُخْلِفُ الْمِیْعَادَ ط اَللّٰھُمَّ کَمَا ھَدَیْتَنِیْ  لِلْاِسْلَامِ اَسْئَلُکَ اَنْ لَّا تَنْزِعَہ مِنِّیْ حَتّٰی تَوَفَّانِیْ وَاَنَا مُسْلِمٌ ط سُبْحَانَ اللّٰہِ  وَالْحَمْدُ لِلّٰہِ وَلَآ اِلٰہَ اِلَّا اللّٰہُ وَاللّٰہُ اَکْبَرُ وَلَاحَوْلَ وَلَا قُوَّۃَ اِلَّا بِاللّٰہِ الْعَلِیِّ الْعَظِیْمِط اَللّٰھُمَّ صَلِّ وَسَلِّمْ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَّعَلٰٓی اٰلِہٖ وَ اَصْحَابِہٖ وَاَزْوَاجِہٖ وَذُرِّیَّاتِہٖ  وَاَتْبَاعِہٖ اِلٰی یَوْمِ الدِّیْنِط اَللّٰھُمَّ اغْفِرْلِیْ وَلِوَالِدَیَّ وَلِجَمِیْعِ الْمُسْلِمِیْنَ  وَالْمُسْلِمَاتِ وَسَلَامٌ عَلَی الْمُرْسَلِیْنَ وَالْحَمْدُ لِلّٰہِ رَبِّ الْعٰلَمِیْنَط', 'Audiopath': 'assets/audios/Safah Marwa.mp3','Step': 'Step_4'},

];
       for (var data in dataList) {
          await db.insert('Guide',data);
       }
  }
  Future close() async {
    final db = await instance.database;
    db?.close();
  }
   Future<List<guide>> getDuas() async {
    final db = await instance.database;
    List<Map<String, Object?>>? data = await db?.query(Guide);
    List<guide> dList = [];
    if(data != null){
      for(Map<String,dynamic> d in data){
        Map<String,dynamic> stdMap = d;
        guide s = guide.fromJson(stdMap);
        dList.add(s);
        
      }
    }
    return dList;
  
  }

  // Operations

   Future<int?> createA(AM s) async {
    
    final db = await instance.database;
    final id =await db!.insert(AdminTable, s.toJson());
      if (kDebugMode) {
            print(id);
          }
    return id;

  }
   
 Future<int> deletea() async {
     final db = await instance.database;
    return await db!.delete(AdminTable, );
  }
   

  Future<int?> createG(GM s) async {
    
    final db = await instance.database;
    final id =await db!.insert(Groups, s.toJson());
      if (kDebugMode) {
            print(id);
          }
    return id;

  }
   
    Future<int> deleteg(int? id) async {
     final db = await instance.database;
    return await db!.delete(Groups, where: '${GMFields.id} = ?', whereArgs: [id]);
  }
// ignore: body_might_complete_normally_nullable
Future<int?> createC(Cnt s) async {
  // ignore: prefer_const_declarations, unused_local_variable
  // final res='select * from contact where phoneno=s.phoneno';

  //   if(res.length==0){}
 final db = await instance.database;
    final id = db!.insert(Contacts, s.toJson());
      if (kDebugMode) {
            print(id);
          }
    return id;
   }
    
Future<List<String>> getPhoneNumbers(int groupid) async {
  List<String> phoneNumbers = [];
  final db = await instance.database;
  // ignore: unnecessary_string_interpolations

  List<Map<String, dynamic>> rows = await db!.rawQuery('SELECT ${CntFields.phoneno} FROM $Contacts WHERE ${CntFields.fkgid}=$groupid');

  for (Map<String, dynamic> row in rows) {
    // Extract the phone number from the row
    String phoneNumber = row[CntFields.phoneno];

    // Add the phone number to the phoneNumbers list
    phoneNumbers.add(phoneNumber);
  }

  return phoneNumbers;
}

Future<int> deletec(int? id) async {
     final db = await instance.database;
    return await db!.delete(Contacts, where: '${CntFields.id} = ?', whereArgs: [id],);
  }

Future<List<GM>> getGroups() async {
    final db = await instance.database;
    List<Map<String, Object?>>? data = await db?.query(Groups);
    List<GM> sList = [];
    if(data != null){
      for(Map<String,dynamic> d in data){
        Map<String,dynamic> stdMap = d;
        GM s = GM.fromJson(stdMap);
        sList.add(s);
        
      }
    }
    return sList;
  
  }

Future<List<String>> getIGroups(int groupid) async {
  final db = await instance.database;
  // ignore: unnecessary_string_interpolations
  List<Map<String, Object?>>? data = await db!.rawQuery('SELECT * FROM $Groups WHERE ${GMFields.id}=$groupid');
  List<String> groupList = [];
  if (data != null) {
    for (Map<String, dynamic> d in data) {
      String groupName = d[GMFields.Group_Name] as String;
      String groupDescription = d[GMFields.Group_Description] as String;
      String adminNumber = d[GMFields.Admin_num] as String;
      String adminName = d[GMFields.Admin_name] as String;

      // Append the group details as a formatted string
      String groupDetails =
          '$groupName,$groupDescription,$adminNumber,$adminName';
      groupList.add(groupDetails);
    }
  }
  return groupList;
}

Future<List<Cnt>> getContacts() async {

    final db = await instance.database;
    List<Map<String, Object?>>? data = await db?.query(Contacts);
    List<Cnt> cList = [];
    if(data != null){
      for(Map<String,dynamic> d in data){
        Map<String,dynamic> stdMap = d;
        Cnt s = Cnt.fromJson(stdMap);
       cList.add(s);
        
      }
    }
    return cList;
  
  }

Future<List<Cnt>> getGroupMembers(int groupid) async {
    final db = await instance.database;
    List<Map<String, Object?>>? data = await db?.query(Contacts,where: '${CntFields.fkgid}=?',whereArgs: [groupid]);
    List<Cnt> cList = [];
    if(data != null){
      for(Map<String,dynamic> d in data){
        Map<String,dynamic> stdMap = d;
        Cnt s = Cnt.fromJson(stdMap);
       cList.add(s);
        
      }
    }
    return cList;
  
  }



Future<String?> getAdminPhoneNo() async {
  // Open the database
   final db = await instance.database;

  // Execute the query
  List<Map<String, dynamic>> result = await db!.rawQuery(
    'SELECT ${AMFields.anum} FROM $AdminTable ',
    
  );


  // Extract the phone number from the query result
  if (result.isNotEmpty) {
    // ignore: unnecessary_string_interpolations
    return result.first['${AMFields.anum}'].toString();
  } else {
    return null; // Admin not found or phone number is null
  }
}


Future<String?> getGroupPhoneNo(int groupId) async {
 final db = await instance.database;

  // Execute the query
  List<Map<String, dynamic>> result = await db!.rawQuery(
    'SELECT ${GMFields.Admin_num} FROM $Groups  WHERE ${GMFields.id}=$groupId',
);
    if (result.isNotEmpty) {
    // ignore: unnecessary_string_interpolations
    return result.first['${GMFields.Admin_num}'].toString();
  } else {
    return null; // Admin not found or phone number is null
  }
    
  
}

}