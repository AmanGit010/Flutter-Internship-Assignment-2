import 'package:flutter/material.dart';

class explore extends StatelessWidget {
  const explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text("Explore page will come here!"),
      )),
    );
  }
}
