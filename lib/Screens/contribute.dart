import 'package:flutter/material.dart';

class contribute extends StatelessWidget {
  const contribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contribute"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text("Contribution page will come here!"),
      )),
    );
  }
}
