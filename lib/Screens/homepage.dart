// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, duplicate_ignore

import 'dart:async';


import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugom/Screens/GuideScreen.dart';

import 'package:hugom/Screens/ug.dart';
import 'package:hugom/util/database.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../model/contactmodel.dart';
import '../model/groupmodel.dart';
import 'GroupDetails_Members.dart';
import 'creategroup.dart';
import 'GroupDetails_Admin.dart';
import 'hg.dart';
import 'mapscreen.dart';

// import 'package:hugom/model/model.dart';


// ignore: must_be_immutable
class HP extends StatefulWidget {
   const HP({super.key});


 
  @override
  State<HP> createState() => _HPState();
}

class _HPState extends State<HP> {

 gaa(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Group Added Through SMS",
    
      buttons: [
       
      ],
    ).show();
  }
  gda(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Group Deleted Through SMS",
    
      buttons: [
       
      ],
    ).show();
  }
  caa(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Member Added Through SMS",
    
      buttons: [
       
      ],
    ).show();
  }
  cda(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Member Deleted Through SMS",
    
      buttons: [
       
      ],
    ).show();
  }
  Future<void> ListenForSMS() async
{
  final dbHelper = db.instance;

  


  Timer.periodic(const Duration(seconds: 15), (timer) async {
 final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
    var permission = await Permission.sms.status;
  if (permission.isGranted) {
              final messages = await _query.querySms(
                kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
                // address: '+254712345789',
                sort: true,
                count: 5
                
                 
              );
              
              debugPrint('sms inbox messages: ${messages.length}');

              // setState(() => _messages = messages);
            // ignore: avoid_function_literals_in_foreach_calls
            messages.forEach((element) {
               final command = element.body!.toLowerCase();
    final args = command.split(',');
    if (args.isNotEmpty) {
      switch (args[0].trim()) {
        case 'addgroup':
          if (args.length == 5) {
            final  group = GM(  
              Group_Name: args[1],
              Group_Description: args[2],
              Admin_name: args[3],
              Admin_num: args[4],
            );
            
            dbHelper.createG(group);
            gaa(context);
          }
          break;
        case 'addcontact':
          if (args.length == 5) {
            final contact = Cnt(
             
              fname: args[1],
              lname: args[2],
              phoneno: args[3],
              fkgid: int.parse(args[4]),
            );
            dbHelper.createC(contact);
            caa(context);
          }
          break;
      
        case 'deletegroup':
          if (args.length == 2) {
            final id = int.parse(args[1]);
            dbHelper.deleteg(id);
            gda(context);
          }
          break;
        case 'deletecontact':
          if (args.length == 2) {
            final id = int.parse(args[1]);
            dbHelper.deletec(id);
            cda(context);
          }
          break;
       
            
      }
    }
// if (kDebugMode) {
//    print('${element.body},${element.dateSent}');
// }
 // Update the lastDateSent to the latest message's dateSent
      
             });
            } else {
              await Permission.sms.request();
            }
      
   });
}





delgalert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Group Deleted !",
    
      buttons: [
     
      ],
    ).show();
  }
   int _currentIndex = 0;
  late PageController _pageController;
   List<GM> glist = [];
   void fetchGroups()async {
    //  fetch list of groups from database and assign it to glist
        glist = await db.instance.getGroups();
        setState(() {
          
        });
   }
    void DeleteGroups(int? id)async {
   
      
        // ignore: unused_local_variable
        await db.instance.deleteg(id);
        setState(() {
            glist.removeWhere((Groups) => Groups.id == id);
        });
   }
 int? selectedgid;
 
Widget displayData() {
 
  
    if (glist.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: glist.length,
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
                    leading: const Icon(FontAwesomeIcons.userGroup),
                                 title: Text(glist[index].Group_Name.toString()),
                  subtitle: Text(glist[index].Group_Description.toString()),
                  
                  trailing:          GestureDetector(child: 
                  const Icon(Icons.delete,color:Colors.red),
                  onTap: ()async{

                      String? adminPhoneNo = await db.instance.getAdminPhoneNo(); 
  
   if (adminPhoneNo == null) {
     return;
   }
   String? groupPhoneNo = await db.instance.getGroupPhoneNo(selectedgid!); 
                    if (adminPhoneNo.trim() == groupPhoneNo!.trim()) {
                           DeleteGroups(glist[index].id);
                                delgalert(context);
                    }
                    else{
                        
                    }

                                },),
                ),
              ),
               onTap: () async {
                                selectedgid=glist[index].id;

                               if(selectedgid==null) {
                                 return;
                               }
                                String? adminPhoneNo = await db.instance.getAdminPhoneNo(); // Implement this function to fetch the phone number
  
   if (adminPhoneNo == null) {
     return;
   }
  
  // // Retrieve the phone number associated with the selected group
   String? groupPhoneNo = await db.instance.getGroupPhoneNo(selectedgid!); 
  
   if (adminPhoneNo.trim() == groupPhoneNo!.trim()) {
  //   // Phone numbers match, navigate to GDA screen
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => GDA(groupid: selectedgid!)),
     );
   } else {
     // Phone numbers don't match, navigate to GDM screen
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => GDM(groupid: selectedgid!)),
     );
   }
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => GDA(groupid: selectedgid!,)));
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
   ListenForSMS();
    _pageController = PageController();
    fetchGroups();
    displayData();
   
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context=context;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: Colors.purple,title: const Text("Hajj & Umrah (Offline Maps)",  ),
      // automaticallyImplyLeading: false
      // ,actions: <Widget>[
      //   GestureDetector(child : const Text("Logout",style: TextStyle(fontSize: 20 )),onTap: () {
      //      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login()));
      //   },)
      // ]
       ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          // color: Colors.red,
          children: <Widget>[
             Container(
            
                   constraints: const BoxConstraints.expand(height: 600,width: 700),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Image.asset(
                      "assets/images/sc1.jpg",
                      fit: BoxFit.cover,
                    )
            ),
            // ignore: avoid_unnecessary_containers
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage("assets/images/sc1.jpg"),
                  fit: BoxFit.cover,
                )
            ),
              child:  Column(
            
            children:  [
              // ignore: avoid_unnecessary_containers
              // Container(child: ElevatedButton(onPressed:(){
              //    Navigator.push(context, MaterialPageRoute(builder: (context) => const GDA()));
              // } ,child: const Text("Group Details")),),
                         Container(
                          
                          child :  displayData()
                         ),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 
                  FloatingActionButton(
                    backgroundColor: Colors.purple,
                    onPressed: () async{

            // ignore: unused_local_variable
            dynamic d    =await Navigator.push(

   context, MaterialPageRoute(builder: (context) => const CG()) );
            
                 
                
                 fetchGroups();
             },child: const Icon(Icons.add),
             
             )
            
                ],
               ),
                
            ],
            
              ),
          ),
              
            SingleChildScrollView(
              child: 
  
              Container(
        decoration: const BoxDecoration(
         
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const SizedBox(height: 16), 
              ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color.fromARGB(255, 16, 101, 212),
    fixedSize: const Size(2000, 220), ),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  hg()));
                },
                 icon: const Icon(Icons.mosque_rounded,size: 70,color: Colors.yellow,),
            
                label: const Text('Hajj Guide',style: TextStyle(fontSize: 30),),
              ),
              const SizedBox(height: 16), 
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                   backgroundColor: const Color.fromARGB(255, 16, 101, 212),
    fixedSize: const Size(2000, 220), // Set the desired width and height
  ),
  
                onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>   ug()));
                },
                 icon: const Icon(Icons.mosque_sharp,size: 70,color: Colors.green,),
                label: const Text('Umrah Guide',style: TextStyle(fontSize: 30),),
              ),
              const SizedBox(height: 16), 
              ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color.fromARGB(255, 16, 101, 212),
    fixedSize: const Size(2000, 208), ),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  gs()));
                },
                icon : const Icon(Icons.book, size: 70,color: Colors.red,),
                label: const Text('All Duas',style: TextStyle(fontSize: 30),),
              ),
            ],
          ),
        ),
      ),

            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: const OfflineMapScreen()
                // constraints: const BoxConstraints.expand(height: 800,width: 700),
                //     decoration: const BoxDecoration(color: Colors.grey),
                //     child: Image.asset(
                //       "assets/images/dm.PNG",
                //       fit: BoxFit.cover,
                //     )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text('Home',style: TextStyle(color: Colors.purple),),
            icon: const Icon(Icons.home,color: Colors.purple,)
          ),
          BottomNavyBarItem(
            title: const Text('Groups',style: TextStyle(color: Colors.purple),),
            icon: const Icon(Icons.group,color: Colors.purple,)
          ),
          BottomNavyBarItem(
            title: const Text('Guide',style: TextStyle(color: Colors.purple),),
            icon: const Icon(Icons.book,color: Colors.purple,)
          ),
          BottomNavyBarItem(
            title: const Text('  Map',style: TextStyle(color: Colors.purple),),
            icon: const Icon(FontAwesomeIcons.mapLocationDot,color: Colors.purple,)
          ),
        ],
      ),
    );

  }
  }
