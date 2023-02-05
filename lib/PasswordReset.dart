import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {

  late final TextEditingController _newPassword;
  late final TextEditingController _code;

  @override
  void initState() {

    _newPassword = TextEditingController();
    _code = TextEditingController();// TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _newPassword.dispose();
    _code.dispose();// TODO: implement dispose
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset Password'),
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
                              TextButton(onPressed: () {
                                showDialog(context: context, builder: (context) => AlertDialog(
                                  title: Text('Emter Reset Code'),
                                  content: TextField(
                                    controller: _code,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Emter Reset Code',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(onPressed: () {Navigator.of(context).pop();}, child: Container(
                                      color: Colors.blue,
                                      padding: EdgeInsets.all(14),
                                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                                    ))
                                  ],
                                ));
                              }, child: Text('Enter Reset Code'),),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _newPassword,
                                obscureText: true,
                                autocorrect: false,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    hintText: 'Choose a new password',
                                    border: OutlineInputBorder(),
                                    labelText: 'Choose a new password',
                                    icon: Icon(Icons.password)
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _newPassword,
                                obscureText: true,
                                autocorrect: false,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    hintText: 'Re-enter password',
                                    border: OutlineInputBorder(),
                                    labelText: 'Re-enter password',
                                    icon: Icon(Icons.password)
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(onPressed: () async {
                                final newPassword = _newPassword.text;
                                final code = _code.text;
                                await FirebaseAuth.instance.confirmPasswordReset(
                                    code: code, newPassword: newPassword);
                              }, child: Text('Reset Password'))
                            ],
                          ),
                        )
                  );
                default:
                  return Text('Loading...');
              }
            }
        )
    );
  }
}