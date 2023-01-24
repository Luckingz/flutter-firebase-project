import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                  icon: Icon(Icons.password)
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: null, child: Text('Login')),
              Row(
                children: [
                  Text('New User?'),
                  TextButton(onPressed: null, child: Text('Create an account'))
                ],
              )
            ],
          )
        ),
      )
    );
  }
}