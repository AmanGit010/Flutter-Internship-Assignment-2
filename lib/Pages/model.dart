// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'demo.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// final CollectionReference _collectionReference =
//     FirebaseFirestore.instance.collection('Courses');

// class course {
//   final String courseName;
//   final String courseSummary;
//   final String courseCategory;
//   final String subCategory;
//   final int courseID;
//   final int fees;
//   final String level;
//   final String method;
//   final String location;
//   final String uniName;
//   final String startDate;
//   final String duration;

//   course(
//       {required this.courseCategory,
//       required this.courseID,
//       required this.courseName,
//       required this.courseSummary,
//       required this.duration,
//       required this.fees,
//       required this.level,
//       required this.location,
//       required this.method,
//       required this.startDate,
//       required this.subCategory,
//       required this.uniName});
// }

// List<User> userList = [];
// void getData() {
//   _collectionReference.get().then((QuerySnapshot snapshot) {
//     snapshot.docs.forEach((course) {
//       userList.add(course(
//         courseName: course.data()['courseName'],
//         uniName: course.data()['email'],
//       ));
//     });
//   });
// }
