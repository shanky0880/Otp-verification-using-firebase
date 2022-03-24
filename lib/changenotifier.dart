import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Apicall extends ChangeNotifier {
  String _verificationCode = '';

  Future pressLog(
    String phone,
  ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        final value =
            await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationCode = verificationId;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<bool> otpcheck(String otp) async {
    PhoneAuthCredential phoneauth = PhoneAuthProvider.credential(
        verificationId: _verificationCode, smsCode: otp);
    final value = await FirebaseAuth.instance.signInWithCredential(phoneauth);

    if (value.user != null) {
      return true;
    } else {
      return false;
    }
  }
}
