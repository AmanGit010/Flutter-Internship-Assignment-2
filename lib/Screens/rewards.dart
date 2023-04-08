import 'package:flutter/material.dart';

class rewards extends StatelessWidget {
  const rewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rewards"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text("Rewards page will come here!"),
      )),
    );
  }
}
