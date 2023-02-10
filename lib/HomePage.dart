import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
            Icon(Icons.account_circle, size: 60,),
            Text('UserName',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            ListTile(
              
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
