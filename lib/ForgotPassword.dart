import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password?'),
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
              ElevatedButton(onPressed: null, child: Text('Reset Password'))
            ],
          )
        ),
      )
    );
  }
}