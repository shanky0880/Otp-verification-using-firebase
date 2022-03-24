import 'package:emailotp/changenotifier.dart';
import 'package:emailotp/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'Phone number verification',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(
                  prefix: Text(
                    '+ 91',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  hintText: 'Enter Your Phone Number'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
               
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpScreen(
                            nomber: phone.text,
                          )),
                );
              },
              child: Text('Submit'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(300, 40)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
