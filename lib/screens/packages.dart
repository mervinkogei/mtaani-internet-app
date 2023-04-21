import 'package:flutter/material.dart';

class Packages extends StatefulWidget {
  Packages({Key? key}) : super(key: key);

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Packages'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}