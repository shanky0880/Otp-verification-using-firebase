import 'package:emailotp/changenotifier.dart';
import 'package:emailotp/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
    required this.nomber,
  }) : super(key: key);
  final String nomber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    context.read<Apicall>().pressLog(
          '+91${widget.nomber}',
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String requiredNumber = '1234';
    return Scaffold(
        appBar: AppBar(
          title: Text('Otp verification'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'Otp is send to the number ${widget.nomber} .',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 6,
              onChanged: (value) {
                print(value);
              },
              onCompleted: (value) {
                context.read<Apicall>().otpcheck(value).then((value) => value
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()))
                    : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Wrong Otp Enter ',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.green,
                      )));

                // if () {

                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text(
                //       'Wrong Otp Enter ',
                //       style:
                //           TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                //     ),
                //     backgroundColor: Colors.green,
                //   ));
                // }
              },
            )
          ],
        ));
  }
}
