import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';


// ignore: camel_case_types
class rmsg extends StatefulWidget {
  const rmsg({Key? key}) : super(key: key);

  @override
  State<rmsg> createState() => _rmsgState();
}

// ignore: camel_case_types
class _rmsgState extends State<rmsg> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  void getaddress(){

  }
// ignore: non_constant_identifier_names
Future<void> RecieveChats() async {
            var permission = await Permission.sms.status;
            if (permission.isGranted) {
              final messages = await _query.querySms(
                kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
                //  address: '',
                count: 10,
              );
              debugPrint('sms inbox messages: ${messages.length}');

              setState(() => _messages = messages);
            } else {
              await Permission.sms.request();
            
          }
        }
  @override
  void initState() {
    super.initState();
    RecieveChats();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recieved Messages'),
          
        ),
        body: Container(
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
    );
  }
}