// ignore_for_file: unnecessary_import, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugom/Screens/homepage.dart';
import 'package:hugom/model/contactmodel.dart';
import 'package:hugom/util/database.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../model/groupmodel.dart';
import 'GroupDetails_Admin.dart';
class CG extends StatefulWidget {
  const CG({super.key});

  @override
  State<CG> createState() => _CGState();
}

class _CGState extends State<CG> {
  TextEditingController gnamec=TextEditingController();
TextEditingController gdescc=TextEditingController();
TextEditingController admno=TextEditingController();
TextEditingController admnm=TextEditingController();
  late String gname,gdesc;
  late String adminno,adminname;
    String lname=".";
  // ignore: unused_element
  cgalert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Group Created",
      // desc: "",
      buttons: [
        // DialogButton(
        //   onPressed: () => cgalert(context),
        //   width: 120,
        //   child: 
        //   const Text(
        //     "Go Back",
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        // )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
              const SizedBox(height: 50),
          
                // logo
                const Icon(
                    Icons.group_add,
                  size: 100,
                ),
          
                const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(1),
                
                child: const Text(
                  'Create a Group ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
 Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: gnamec,
                 onChanged: (value) {
                  gname = value.toString();
                   },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Group Name',
                  
                ),
              ),
            ),
Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: gdescc,
                 onChanged: (value) {
                  gdesc = value.toString();
                   },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Group Description',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: admnm,
                 onChanged: (value) {
                  adminname = "$value  (Admin)";
                   },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Admin Name',
                ),
              ),
            ),
            Container(
         
              padding: const EdgeInsets.all(10),
              child: TextField(
            //  maxLength: 11,
  
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Admins Number',
                    // counterText: 'Enter 11 Digits only ',
                ),
                controller: admno,
                 onChanged: (value) {
                  adminno = value.toString();
                   },
               
              ),
            ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Create'),
                  onPressed: ()async {
                    adminname=admnm.text;
                  GM s =
                      GM(Group_Name: gname, Group_Description: gdesc,Admin_name: adminname,Admin_num: adminno);
                     // ignore: unused_local_variable
                     int? groupId=await db.instance.createG(s);
                      Cnt contact = Cnt(
    fname: adminname,
    lname: lname,
    phoneno: adminno,
    fkgid: groupId,
  );  
  // ignore: unused_local_variable
  int? contactId = await db.instance.createC(contact);
                   // ignore: use_build_context_synchronously
                   cgalert(context);
                   
                    gnamec.clear();
                    gdescc.clear();
                    admnm.clear();
                    admno.clear();
                  },
                )
            ),                  ]          
    )));
  }
}















