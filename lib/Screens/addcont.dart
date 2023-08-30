// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, unnecessary_brace_in_string_interps, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, use_build_context_synchronously


// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';
import 'package:hugom/util/database.dart';
import '../model/contactmodel.dart';



// ignore: camel_case_types
class cinfo extends StatefulWidget {

  int group_id;
 cinfo({required this.group_id});

  @override
  // ignore: library_private_types_in_public_api
  _cinfoState createState() => _cinfoState();
}

// ignore: camel_case_types
class _cinfoState extends State<cinfo> {
   String? gn,gd,ano,an;
  List<Contact>? contacts;
  Future<void> _fetchGroups() async {
    List<String> groupList = await db.instance.getIGroups(widget.group_id);
    
    // Use the groupList as needed
    for (String groupDetails in groupList) {
      if (kDebugMode) {
        print(groupDetails);
      }
       gn = groupList[0];
       gd = groupList[1];
       ano = groupList[2];
       an = groupList[3];
      // Perform other operations with the group details
    }
  }
   
   ccalert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Contact Added !",
      // desc: "",
      buttons: [
        // DialogButton(
        //   onPressed: () => ccalert(context),
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
  void _sendSMS(
      {required String message, required List<String> recepients}) async {
    String _result = await sendSMS(
            message: message, recipients: recepients, sendDirect: true)
        // ignore: body_might_complete_normally_catch_error
        .catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    if (kDebugMode) {
      print(_result);
    }
  }
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _fetchGroups();
    getContact();
   
  }
   
  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      // ignore: avoid_print
      print(contacts);
      setState(() {});
    }
  }
  int nl=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contacts",
            style: TextStyle(color: Colors.blue),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: (contacts) == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List? image = contacts![index].photo;
                  String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
                  return ListTile(
                      leading: (contacts![index].photo == null)
                          ? const CircleAvatar(child: Icon(Icons.person))
                          : CircleAvatar(backgroundImage: MemoryImage(image!)),
                      title: Text(
                          "${contacts![index].name.first} ${contacts![index].name.last}"),
                      subtitle: Text(num),
                      trailing: GestureDetector(child: 
                      const Icon(Icons.group_add),
                      onTap:()async{
                        await sendSMS(message:'addgroup,$gn,$gd,$ano,$an',recipients:[num]);
                      } ,),
                      onTap: ()async {
                        if (contacts![index].phones.isNotEmpty) {
                          //ignore: deprecated_member_use
                           
                              var c=contacts![index];
                            
                          
                  
                      await sendSMS(message:'addcontact,${c.name.first},${c.name.last},${num},${widget.group_id}' , recipients:[num]);
                      Cnt s =
                      Cnt(fname:c.name.first,lname:c.name.last , phoneno:num.trim(),fkgid:widget.group_id);
                   db.instance.createC(s);
                       ccalert(context);
                       
                       
                       

                        }
                      });
                },
              ));
  }
}