import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:user_auth/ui/auth/verify_code.dart';
import 'package:user_auth/ui/post/post_screen.dart';
import 'package:user_auth/utils/utils.dart';
import 'package:user_auth/widgets/buttons.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationID;
  const VerifyCodeScreen({super.key, required this.verificationID});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = false;
  final verifyCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: verifyCodeController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter 6-digit code",
              ),
            ),
            SizedBox(
              height: 80,
            ),
            RoundButton(
                title: "Verify",
                loading: loading,
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationID,
                      smsCode: verifyCodeController.text.toString());
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostScreen()));
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    utils().toastMessage(e.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
