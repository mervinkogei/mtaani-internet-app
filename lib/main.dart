import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
                primarySwatch: Colors.blue,
                canvasColor: const Color(0xff403B34),
                backgroundColor: Colors.purple,
                cardColor: const Color(0xffE0698C),
                indicatorColor: const Color(0xffFE5A7D),
                buttonColor: const Color.fromARGB(255, 248, 215, 218),
                scaffoldBackgroundColor: const Color(
                  0xffFFF1F5,
                ),
                hintColor: const Color(0xff6679B3),
                selectedRowColor: const Color(0xff3087B5),
                unselectedWidgetColor: const Color(0xffE0698C),
                primaryColor: const Color(0xffffffff),
                accentColor: const Color(0xff8E8C90),
                hoverColor: const Color(0xffFF6092),
                secondaryHeaderColor: const Color(0xffFEFAF4),
                shadowColor: const Color.fromRGBO(137, 209, 239, 1),
                focusColor: const Color(0xff8ABFF4),
                primaryColorLight: const Color(0xffFFE6E8),
                primaryColorDark: const Color(0xffD7EEF2)

            ),     
      home: SplashScreen(
        backgroundColor: Colors.purple,
        duration: const Duration(seconds: 15),
        nextPage: const MyHomePage(),
        circleHeight: 200,
        text: const Text(
          "Mtaani Poa Internet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        child:Image.asset('images/new_logo.png',),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'KE';
  PhoneNumber number = PhoneNumber(isoCode: 'KE');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          children: [
            Image.asset('images/new_logo.png', width: 150,height: 150),
            const Text(
              'MOBILE NUMBER', style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
            key: formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Enter your mobile number'),
                  const SizedBox(height: 15),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                    },
                    onInputValidated: (bool value) {
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DROPDOWN,
                    ),
                    ignoreBlank: false,
                    isEnabled: true,
                    autoValidateMode: AutovalidateMode.disabled,
                    inputDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide: BorderSide(
                          color: Colors.grey,
                          
                        )
                      )
                    ),
                    initialValue: number,
                    textFieldController: controller,
                    formatInput: false,
                    keyboardType: TextInputType.none,
                        // TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),
                    onSaved: (PhoneNumber number) {
                    },
                  ),
                  Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(
              "We'll send an sms with a code to verify your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          NumericKeyboard(
            onKeyboardTap: _onKeyboardTap,
            textColor: Colors.grey,
            rightButtonFn: () {
              setState(() {
                controller.text = controller.text .substring(0, controller.text .length - 1);
              });
            },
            rightIcon: Icon(
              Icons.backspace,
              color: Colors.grey,
            ),
            leftButtonFn: () {
            },
          ),
        ],
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).backgroundColor),        
                    onPressed: () {
                      formKey.currentState?.validate();
                    },
                    child: Text('Send Me SMS'),
                  ),
         
        ],
      )
                
                ],
              ),
            ),
            ),
          ),
        ),
      ),
     
          ],
        ),
      ),
    );
  }
  _onKeyboardTap(String value) {
    setState(() {
      controller.text  = controller.text  + value;
    });
  }
   void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'KE');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
