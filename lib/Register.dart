import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new account'),
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.name,
                            controller: _name,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintText: 'Enter your Full Name',
                              border: OutlineInputBorder(),
                              labelText: 'Enter your Full Name',
                              icon: Icon(Icons.account_box),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
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
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintText: 'Re-enter your E-mail Address',
                              border: OutlineInputBorder(),
                              labelText: 'Re-enter your E-mail Address',
                              icon: Icon(Icons.mail),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _password,
                            obscureText: true,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Choose a password',
                                border: OutlineInputBorder(),
                                labelText: 'Choose a password',
                                icon: Icon(Icons.password)
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _password,
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
                          ElevatedButton(
                              onPressed: null, child: Text('Create account')),
                          Center(
                            child: Row(
                              children: [
                                Text("Already have an account?"),
                                TextButton(onPressed: () async {
                                  final email = _email.text;
                                  final password = _password.text;
                                  final name = _name.text;
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                      email: email, password: password);
                                }, child: Text('Login'))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              );
            default:
              return Text('Loading...');
          }
        }
      ),
    );
  }
}