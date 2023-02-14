import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.),
        title: Text('HomePage'),
        actions: [
          Row(
            children: [
              IconButton(onPressed: null, icon: Icon(Icons.settings,
              color: Colors.white,))
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: [
            Icon(Icons.account_circle, size: 120,),
            Text('UserName',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            ListTile(
              onTap: () {},
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              leading: const Icon(Icons.group),
              title: Text('Groups',
              style: TextStyle(
                color: Colors.black
              ),
              ),
            ),
            ListTile(
              onTap: () {},
              selectedColor: Theme.of(context).primaryColor,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              leading: const Icon(Icons.group),
              title: Text('Groups',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              selectedColor: Theme.of(context).primaryColor,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              leading: const Icon(Icons.exit_to_app),
              title: Text('Logout',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.blue[200],
        child: Text(
          'Chat'
        ),
      ),
    );
  }
}
