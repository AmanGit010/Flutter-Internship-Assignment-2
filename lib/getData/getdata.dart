import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetData extends StatelessWidget {
  final String docuId;
  GetData({required this.docuId});

  @override
  Widget build(BuildContext context) {
    CollectionReference data = FirebaseFirestore.instance.collection('Courses');
    return FutureBuilder<DocumentSnapshot>(
        future: data.doc(docuId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data1 =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('Course Name: ${data1['subCategory']}');
          }
          return Text("Loading");
        }));
  }
}
