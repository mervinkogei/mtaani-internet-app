import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Image.asset("images/new_logo.png", width: 50, height: 50,),  
        elevation: 0,
        actions: <Widget>[
    IconButton(
      icon: const Icon(
        Icons.notifications,
        color: Colors.white,
      ),
      onPressed: () {
      },
    )
  ],      
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}