import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();// TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();// TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password?'),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Container(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintText: 'Enter your E-mail Address',
                            border: OutlineInputBorder(),
                            labelText: 'Enter your E-mail Address',
                            icon: Icon(Icons.mail),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(onPressed: () async {
                          final email = _email.text;
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: email);
                        }, child: Text('Reset Password'))
                      ],
                    )
                ),
              );
            default:
              return Text('Loading...');
          }
        }
      )
    );
  }
}