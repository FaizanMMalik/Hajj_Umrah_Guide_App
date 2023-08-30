
// // ignore: avoid_web_libraries_in_flutter
// import 'dart:js';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:flutter/foundation.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:permission_handler/permission_handler.dart';
// // ignore: import_of_legacy_library_into_null_safe
// // import 'package:sms_maintained/sms.dart' show SmsMessage, SmsReceiver;
// import 'package:hugom/util/database.dart';
// import 'package:hugom/model/contactmodel.dart';
// import 'package:hugom/model/groupmodel.dart';
// Future<void> main() async {
//   final dbHelper = db.instance;
//   gaa(context) {
//     Alert(
//       context: context,
//       type: AlertType.success,
//       title: "Group Added Through SMS",
    
//       buttons: [
       
//       ],
//     ).show();
//   }
//   gda(context) {
//     Alert(
//       context: context,
//       type: AlertType.success,
//       title: "Group Deleted Through SMS",
    
//       buttons: [
       
//       ],
//     ).show();
//   }
//   caa(context) {
//     Alert(
//       context: context,
//       type: AlertType.success,
//       title: "Member Added Through SMS",
    
//       buttons: [
       
//       ],
//     ).show();
//   }
//   cda(context) {
//     Alert(
//       context: context,
//       type: AlertType.success,
//       title: "Member Displayed Through SMS",
    
//       buttons: [
       
//       ],
//     ).show();
//   }
//   dga(context) {
//     Alert(
//       context: context,
//       type: AlertType.success,
//       title: "Group Displayed Through SMS",
    
//       buttons: [
       
//       ],
//     ).show();
//   }
//   dca(context) {
//     Alert(
//       context: context,
//       type: AlertType.success,
//       title: "Member Displayed Through SMS",
    
//       buttons: [
       
//       ],
//     ).show();
//   }


//   SmsReceiver receiver = SmsReceiver();
//   receiver.onSmsReceived.listen((SmsMessage message) {
//     final command = message.body!.toLowerCase();
//     final args = command.split(',');
//     if (args.isNotEmpty) {
//       switch (args[0]) {
//         case 'addgroup':
//           if (args.length == 5) {
//             final  group = GM(  
//               Group_Name: args[4],
//               Group_Description: args[2],
//               Admin_name: args[3],
//               Admin_num: '',
//             );
            
//             dbHelper.createG(group);
//             gaa(context);
//           }
//           break;
//         case 'addcontact':
//           if (args.length == 6) {
//             final contact = Cnt(
             
//               fname: args[2],
//               lname: args[3],
//               phoneno: args[4],
//               fkgid: int.parse(args[5]),
//             );
//             dbHelper.createC(contact);
//             caa(context);
//           }
//           break;
      
//         case 'deletegroup':
//           if (args.length == 2) {
//             final id = int.parse(args[1]);
//             dbHelper.deleteg(id);
//             gda(context);
//           }
//           break;
//         case 'deletecontact':
//           if (args.length == 2) {
//             final id = int.parse(args[1]);
//             dbHelper.deletec(id);
//             cda(context);
//           }
//           break;
//         case 'getallgroups':
//           dbHelper.getGroups().then((groups) {
//             // ignore: non_constant_identifier_names
//             for (var GMFields in groups) {
//               if (kDebugMode) {
//                 print('ID: ${GMFields.id}');
//               }
//               if (kDebugMode) {
//                 print('Group Name: ${GMFields.Group_Name}');
//               }
//               if (kDebugMode) {
//                 print('Group Description: ${GMFields.Group_Description}');
//               }
//               if (kDebugMode) {
//                 print('Admin Number: ${GMFields.Admin_num}');
//               }
//                if (kDebugMode) {
//                 print('Admin Number: ${GMFields.Admin_name}');
//               }
//               if (kDebugMode) {
//                 print('------');
//               }
//             }
//           }
//           );
//           dga(context);
//           break;
//         case 'getallcontacts':
//           dbHelper.getContacts().then((contacts) {
         
//             // ignore: non_constant_identifier_names
//             for (var CntFields in contacts) {
//               if (kDebugMode) {
//                 print('ID: ${CntFields.id}');
//               }
//               if (kDebugMode) {
//                 print('First Name: ${CntFields.fname}');
//               }
//               if (kDebugMode) {
//                 print('Last Name: ${CntFields.lname}');
//               }
//               if (kDebugMode) {
//                 print('Phone Number: ${CntFields.phoneno}');
//               }
//               if (kDebugMode) {
//                 print('Group ID: ${CntFields.fkgid}');
//               }
//               if (kDebugMode) {
//                 print('------');
//               }
//             }
//           });
//           dca(context);
//           break;
//       }
//     }
//    }   
//   );
// }

// void _sendSMS(
//       {required String message, required List<String> recepients}) async {
//     String _result = await sendSMS(
//             message: message, recipients: recepients, sendDirect: true)
//         .catchError((onError) {
//       print(onError);
//     });
//     print(_result);
//   }void _sendSMS(
//       {required String message, required List<String> recepients}) async {
//     String _result = await sendSMS(
//             message: message, recipients: recepients, sendDirect: true)
//         .catchError((onError) {
//       print(onError);
//     });
//     print(_result);
//   }