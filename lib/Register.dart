import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new account'),
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
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
                ElevatedButton(onPressed: null, child: Text('Create account')),
                Center(
                  child: Row(
                    children: [
                      Text("Already have an account?"),
                      TextButton(onPressed: null, child: Text('Login'))
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}