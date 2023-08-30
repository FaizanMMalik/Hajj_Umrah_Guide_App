// ignore_for_file: non_constant_identifier_names, unnecessary_import, implementation_imports, unused_import, must_be_immutable, use_key_in_widget_constructors, file_names, unnecessary_const

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:hugom/util/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugom/Screens/GuideScreen.dart';
import 'package:hugom/Screens/addcont.dart';
import 'package:hugom/Screens/chat2.dart';
import 'package:hugom/Screens/guide.dart';
import 'package:hugom/Screens/maptest.dart';
import 'package:hugom/Screens/rsms.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../model/contactmodel.dart';
import 'chatscreen_admin.dart';
import 'crudscreen.dart';
import 'mapscreen.dart';

class GDA extends StatefulWidget {
  int groupid;
  GDA({required this.groupid});

  @override
  State<GDA> createState() => _GDAState();
}

class _GDAState extends State<GDA> {
 delgalert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Group Deleted !",
    
      buttons: [
     
      ],
    ).show();
  }
  delcalert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Removed Successfully !",
      
      buttons: [
       
      ],
    ).show();
  }
 List<Cnt> clist = [];
   void fetchContacts()async {
    //  fetch list of groups from database and assign it to clist
        clist = await db.instance.getGroupMembers(widget.groupid);
        setState(() {
          
        });
   }
    void DeleteContacts(int? id)async {
    //  fetch list of groups from database and assign it to clist
      
        // ignore: unused_local_variable
        await db.instance.deletec(id);
        setState(() {
            clist.removeWhere((Contacts) => Contacts.id == id);
        });
   }
  bool showGroup = true;
   void DeleteGroups(int? id)async {
   
      
        // ignore: unused_local_variable
        await db.instance.deleteg(widget.groupid);
        setState(() {
          showGroup = false;
        });
   }
Widget displayContacts() {
    if (clist.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: clist.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                  color: const Color.fromARGB(255, 207, 206, 206),
                  elevation: 5,
  margin: const EdgeInsets.all(10),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
                child: ListTile(
                    leading: const Icon(FontAwesomeIcons.person),
                                 title: Text(clist[index].fname.toString()),
                  subtitle: Text(clist[index].phoneno.toString()),
                  trailing:     
                   Wrap(
                                spacing: 12, // space between two icons
                                 children: <Widget>[
                                    GestureDetector(child: const Icon(FontAwesomeIcons.locationArrow,color:Colors.blue),onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  const OfflineMapScreen()));
                                },), 
                                     GestureDetector(child: const Icon(Icons.delete,color:Colors.red),onTap: (){
                                         DeleteContacts(clist[index].id);
                                delcalert(context);
                                },),

                                       ],
                                       ),
                               
                ),
              ),
               onTap: () {
                               
                             },
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }

  
@override
  void initState() {
    super.initState();

   fetchContacts();
    
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Group Details", ),
      ),
      drawer:Drawer(
         child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        // ignore: prefer_const_constructors
        DrawerHeader(
          decoration: const BoxDecoration(
            color: const Color.fromARGB(255, 207, 206, 206),
          ),
          
          child: const Text(
             'Options',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Chat Test'),
          onTap: () {
              // LaunchApp.openApp(
              //   androidPackageName: 'com.google.android.apps.messaging',
              //   openStore: false
              //);
               Navigator.push(context, MaterialPageRoute(builder: (context) =>  const chat2()));
          },
        ),
          ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Chat Screen'),
          onTap: () {
              // LaunchApp.openApp(
              //   androidPackageName: 'com.google.android.apps.messaging',
              //   openStore: false
              //);
               Navigator.push(context, MaterialPageRoute(builder: (context) =>   ChatScreenA(groupid: widget.groupid)));
          },
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.locationCrosshairs),
          title: const Text('Maps'),
           onTap: () {
              // ignore: prefer_collection_literals
               Navigator.push(context, MaterialPageRoute(builder: (context) =>   const MapScreen()));
          },
        ),
        // ListTile(
        //   leading: const Icon(Icons.create_rounded),
        //   title: const Text('Add a Member'),
        //    onTap: () {
        //        Navigator.push(context, MaterialPageRoute(builder: (context) => const cinfo()));
        //   },
        // ),
         ListTile(
          leading: const Icon(Icons.book),
          title: const Text('Duas'),
           onTap: () {
            
               Navigator.push(context, MaterialPageRoute(builder: (context) =>  gs()));
          },
        ),
        //   ListTile(
        //   leading: const Icon(FontAwesomeIcons.doorOpen),
        //   title: const Text('Leave Group'),
        //    onTap: () {
          
        //                    DeleteGroups(widget.groupid);
        //                         delgalert(context);
                             
        //   },
        // ),
        //    ListTile(
        //   leading: const Icon(Icons.message),
        //   title: const Text('CRUD SMS'),
        //    onTap: () {
        //      Navigator.push(context, MaterialPageRoute(builder: (context) =>  cruds()));
        //   },
        // ),
      ],
    ),
  ),
    

      body:  Container( decoration: const BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage("assets/images/sc1.jpg"),
                  fit: BoxFit.cover,
                )
            ),
        child: Column(
              
              children:  [
      
                Container(child: displayContacts()),
               Row(
                  mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  //  ElevatedButton(onPressed: (){
                  //     Navigator.push(
                  //          context, MaterialPageRoute(builder: (context) => const mst()) );
              
                  //  }, child: const Text("Map Screen Test")),
                    FloatingActionButton(onPressed: () async{
      
              // ignore: unused_local_variable
              dynamic d    =await Navigator.push(
                           context, MaterialPageRoute(builder: (context) =>  cinfo(group_id: widget.groupid)) );
              
                   
                  
                   fetchContacts();
               },child: const Icon(Icons.add),
               
               )
              
                  ],
                 ),
      
      
      
              ]),
      ),

    );
  }
}