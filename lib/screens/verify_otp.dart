import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:poa_internet/screens/dashboard.dart';
import 'package:poa_internet/screens/home.dart';

class VerifyOTP extends StatefulWidget {
  VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

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
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Please enter 4 digit code we\'ve sent you by SMS'),
                  const SizedBox(height: 15),
                  Column(
        children: [
          OtpPinField(
            fieldHeight: 70,
            showDefaultKeyboard: false,
              key: _otpPinFieldController,
              onSubmit: (text) {
              },
              onChange: (text) {
              },
              otpPinFieldStyle: OtpPinFieldStyle(
                  defaultFieldBorderColor: Colors.grey,
                  activeFieldBorderColor: Colors.purple,
                  defaultFieldBackgroundColor: Colors.grey.shade200,
                  activeFieldBackgroundColor: Colors.purple.shade200
                  ),
              maxLength: 4,
              showCursor: true,
              cursorColor: Colors.indigo,              
              showCustomKeyboard: true,
              cursorWidth: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              otpPinFieldDecoration:
                  OtpPinFieldDecoration.defaultPinBoxDecoration),
          Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // NumericKeyboard(
          //   onKeyboardTap: _onKeyboardTap,
          //   textColor: Colors.grey,
          //   rightButtonFn: () {
          //     setState(() {
          //       _otpPinFieldController.currentState!.text = _otpPinFieldController.currentState!.text .substring(0, _otpPinFieldController.currentState!.text   .length - 1);
          //     });
          //   },
          //   rightIcon: const Icon(
          //     Icons.backspace,
          //     color: Colors.grey,
          //   ),
          //   leftButtonFn: () {
          //     _otpPinFieldController.currentState?.clearOtp(); 
          //   },
          // ),
        ],
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).backgroundColor),        
                    onPressed: () {
                      formKey.currentState?.validate();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard()));
                    },
                    child: const Text('Verify OTP'),
                  ),
         
        ],
      )
                
                ],
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
      _otpPinFieldController.currentState!.text  = _otpPinFieldController.currentState!.text  + value;
    });
  }
  //  void getPhoneNumber(String phoneNumber) async {
  //   PhoneNumber number =
  //       await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'KE');

  //   setState(() {
  //     this.number = number;
  //   });
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}