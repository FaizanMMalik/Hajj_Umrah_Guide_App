// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, override_on_non_overriding_member, unused_field, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hugom/util/database.dart';
import '../model/contactmodel.dart';

class ChatScreenA extends StatefulWidget {
int groupid;

   ChatScreenA({required this.groupid});
  @override
  
  State<ChatScreenA> createState() => _ChatScreenAState();
}

class _ChatScreenAState extends State<ChatScreenA> {

   TextEditingController msgc=TextEditingController();
  late String msgcv;
  @override
final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  List<String> phonelist = [];
  late String pnl;
  Future<void> getaddress() async {
       phonelist = await db.instance.getPhoneNumbers(widget.groupid);
        pnl=phonelist.toString();
        setState(() {
          RecieveChats(phonelist);

        });
  }
    String? _message, body;
  void _sendSMS(
      {required String message, required List<String> recepients}) async {
    String _result = await sendSMS(
            message: message, recipients: recepients, sendDirect: false)
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
// List<String> extractPhoneNumbers(List<Cnt> contacts) {
//   return contacts.map((contact) => contact.phoneno).toList();
// }
  // ignore: non_constant_identifier_names
 List<String> extractPhoneNumbers(List<Cnt> contacts) {
  return contacts.map((contact) => contact.phoneno).toList();
}
  
// ignore: non_constant_identifier_names
Future<void> RecieveChats(List<String> phonelist) async {
  var permission = await Permission.sms.status;
  if (permission.isGranted) {
    List<SmsMessage> allMessages = [];
    for (String phoneNumber in phonelist) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
        address: phoneNumber.trim(),
        count: 100,
      );
      allMessages.addAll(messages);
    }
   
    debugPrint('sms inbox messages: ${allMessages.length}');
     debugPrint(phonelist.toString());

    setState(() => _messages = allMessages);
  } else {
    await Permission.sms.request();
    // Handle permission request result
   
  }
}
      //  Future<void> RecieveChats() async {
      //       var permission = await Permission.sms.status;
      //       if (permission.isGranted) {
      //          String? groupPhoneNo = await db.instance.getGroupPhoneNo(widget.groupid); 
      //         final messages = await _query.querySms(
      //           kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
      //             address: groupPhoneNo,
      //           count: 10,
      //         );
      //         debugPrint('sms inbox messages: ${messages.length}');

      //         setState(() => _messages = messages);
      //       } else {
      //         await Permission.sms.request();
            
      //     }
      //   }
  @override
  void initState() {
    super.initState();
   getaddress().then((_) {
    RecieveChats(phonelist);
  });
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj 2023'),
      ),
      body: Column(
        children: [
          Expanded(
            child: 
               Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int i) {
              var message = _messages[i];

              return ListTile(
                title: Text('${message.sender},${message.address} [${message.date}]'),
                subtitle: Text('${message.body}'),
              );
            },
          ),
        ),
        
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                 Expanded(

                  child: 
                    
                      
                  TextField(
                  controller: msgc,
                 onChanged: (value) {
                  msgcv = value.toString();
                   },
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      
                    ),
                    
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                   _sendSMS( message: msgcv, recepients: phonelist);
                  },
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
    
  }
   void _send() {
    if (phonelist.isEmpty) {
      setState(() => _message = 'At Least 1 Person or Message Required');
    } else {
    
    }
  }
  }



