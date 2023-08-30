
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hugom/util/database.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Screens/homepage.dart';
import 'model/admincred.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
final namec = TextEditingController();
  final phnc = TextEditingController();
  late String anamevar, anumvar;
regalert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "You have been Registered !",
      buttons: [],
    ).show();
  }

  void _onIntroEnd(context) {
            AM s = AM(aname: anamevar, anum: anumvar);
        // ignore: unused_local_variable
        db.instance.createA(s);
     
        regalert(context);
       
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HP()),
    );
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    // ignore: unused_local_variable
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
           
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Register Now !',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
         PageViewModel(
          
          title: "",
         
           bodyWidget: 
           
             Column(children:  [
               const SizedBox(height: 50),
          
                // logo
                const Icon(
                    FontAwesomeIcons.addressCard,
                  size: 100,
                ),
          
                const SizedBox(height: 50),
            const Text("Enter your number to Register yourself!"),
            const SizedBox(height: 20,),
             Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: namec,
              onChanged: (value) {
                anamevar = value.toString();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                suffixIcon: Icon(Icons.person),
              ),
            ),
          ),
           const SizedBox(height: 20,),
             Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: phnc,
              onChanged: (value) {
                anumvar = value.toString();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
                suffixIcon: Icon(Icons.call),
              ),
            ),
          ),
        ElevatedButton.icon(onPressed: (){
             Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HP()),
    );
        },  icon : const Icon(Icons.arrow_forward_ios_sharp,), 
        label: const Text("Skip ! If you have already Registered.")),
          ],),
        ),
      ],
     
      
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: false,
      showNextButton: false,
     
    );
  }
}