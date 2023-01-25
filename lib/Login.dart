import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var email;
  var password;

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController(); // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();// TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
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
                controller: _password,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                  icon: Icon(Icons.password),

                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: null, child: Text('Login')),
              Row(
                children: [
                  Text('New User?'),
                  TextButton(onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                    print(userCredential);
                    }, child: Text('Create an account'))
                ],
              )
            ],
          )
        ),
      )
    );
  }
}