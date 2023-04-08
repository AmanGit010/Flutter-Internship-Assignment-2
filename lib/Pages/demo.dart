import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

class demo extends StatefulWidget {
  demo({super.key});

  String _value = 'Option 1';
  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  final search = "'Courses'";
  String _selectedValue = 'Option 1';
  List<String> _dropdownValues = ['Option 1', 'Option 2', 'Option 3'];

  // List<dynamic> docIDs = [];
  // CollectionReference _collectionReference =
  // FirebaseFirestore.instance.collection('Courses');

  // Future getCourse() async {
  //   await FirebaseFirestore.instance.collection('Courses').get().then(
  //         (snapshot) => snapshot.docs.forEach(
  //           (course) {
  //             print(course.reference);
  //             print(course.data());
  //             docIDs.add(course.reference.id);
  //           },
  //         ),
  //       );
  // QuerySnapshot querySnapshot = await _collectionReference.get();
  // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  // print(allData);
  // }

  // @override
  // void initState() {
  //   getCourse();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.image,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              child: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.grey,
              ),
              // ),
              onTap: () {},
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 2),
          //   child: Expanded(
          //     child: VerticalDivider(
          //       thickness: 1,
          //       indent: 12,
          //       endIndent: 12,
          //     ),
          //   ),
          // ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 6),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Color.fromARGB(255, 86, 112, 251),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            onTap: () {},
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 2),
          //   child: Expanded(
          //     child: VerticalDivider(
          //       thickness: 1,
          //       indent: 12,
          //       endIndent: 12,
          //     ),
          //   ),
          // ),
          PopupMenuButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            // color: Colors.black,
            itemBuilder: (context) {
              return [
                const PopupMenuItem<String>(
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ];
            },
          ),
        ],
        title: Text(
          "AmbitionBox",
          style: GoogleFonts.notoSansAvestan(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          // TextStyle(color: Colors.black, fontFamily: GoogleFonts.notoSansAvestan(co)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Material(
            shadowColor: Colors.transparent,
            elevation: 4,
            // borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                // controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded),
                  prefixIconColor: Colors.grey,
                  hintText: "Search",
                  // border: BorderRadius.circular(10),
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  // fillColor: Colors.grey.shade100,
                  // filled: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showPopupMenu(context);
                    },
                    child: const Chip(
                      shadowColor: Colors.grey,
                      elevation: 1,
                      backgroundColor: Colors.white,
                      avatar: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey,
                      ),
                      label: Text("Filter"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showPopupMenu(context);
                    },
                    child: const Chip(
                      shadowColor: Colors.grey,
                      elevation: 1,
                      backgroundColor: Colors.white,
                      avatar: Icon(
                        Icons.category,
                        color: Colors.grey,
                      ),
                      label: Text("Category"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showPopupMenu(context);
                    },
                    child: const Chip(
                      shadowColor: Colors.grey,
                      elevation: 1,
                      backgroundColor: Colors.white,
                      avatar: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                      label: Text("Location"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showPopupMenu(context);
                    },
                    child: const Chip(
                      shadowColor: Colors.grey,
                      elevation: 1,
                      backgroundColor: Colors.white,
                      avatar: Icon(
                        Icons.location_city,
                        color: Colors.grey,
                      ),
                      label: Text("University"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Search results for $search",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          //First container for Flutter development collection
          Container(
            height: 250,
            width: 390,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 120, top: 0, left: 20),
                      child: Image.asset(
                        "Images/stan.png",
                        scale: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 23,
                        left: 15,
                        right: 0,
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Courses')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<Column> clientWidgets = [];
                          if (snapshot.hasData) {
                            final clients =
                                snapshot.data?.docs.reversed.toList();
                            for (var client in clients!) {
                              final clientWidget = Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      launchUrlString(
                                          "https://www.udemy.com/course/flutter-bootcamp-with-dart/");
                                    },
                                    child: Text(
                                      client['courseName'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      client['UniName'],
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 210),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.green,
                                      ),
                                      // color: Colors.green,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.star_half,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "4.5  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 205),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.monetization_on_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Fees'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 217),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_on_sharp),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Location'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 195),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.work_outline_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Method'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 176),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.timer_outlined),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            client['Duration'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              clientWidgets.add(clientWidget);
                            }
                          }
                          return Row(
                            children: clientWidgets,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //Conatiner for React native collection
          Container(
            height: 250,
            width: 390,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 120, top: 0, left: 20),
                      child: Image.asset(
                        "Images/coursera.jpeg",
                        scale: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 23,
                        left: 15,
                        right: 0,
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('react')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<Column> clientWidgets = [];
                          if (snapshot.hasData) {
                            final clients =
                                snapshot.data?.docs.reversed.toList();
                            for (var client in clients!) {
                              final clientWidget = Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      launchUrlString(
                                          "https://www.coursera.org/specializations/meta-react-native");
                                    },
                                    child: Text(
                                      client['courseName'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Text(
                                      client['UniName'],
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 180),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.green,
                                      ),
                                      // color: Colors.green,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.star_half,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "4.5  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 179),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.monetization_on_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Fees'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 192),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_on_sharp),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Location'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 168),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.work_outline_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Method'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 150),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.timer_outlined),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            client['Duration'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              clientWidgets.add(clientWidget);
                            }
                          }
                          return Row(
                            children: clientWidgets,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //Container for vue.js collection
          Container(
            height: 250,
            width: 390,
            decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 120, top: 0, left: 20),
                      child: Image.asset(
                        "Images/udemy.png",
                        scale: 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 23, left: 15),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Vue.js')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<Column> clientWidgets = [];
                          if (snapshot.hasData) {
                            final clients =
                                snapshot.data?.docs.reversed.toList();
                            for (var client in clients!) {
                              final clientWidget = Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 145),
                                    child: GestureDetector(
                                      onTap: () {
                                        launchUrlString(
                                            "https://www.udemy.com/course/vuejs-2-the-complete-guide/");
                                      },
                                      child: Text(
                                        client['courseName'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 55),
                                    child: Text(
                                      client['UniName'],
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 185),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.green,
                                      ),
                                      // color: Colors.green,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star_half,
                                            color: Colors.white,
                                          ),
                                          const Text(
                                            "4.5  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 175),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.monetization_on_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Fees'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 190),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_on_sharp),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Location'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 165),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.work_outline_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Method'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 145),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.timer_outlined),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            client['Duration'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              clientWidgets.add(clientWidget);
                            }
                          }
                          return Row(
                            children: clientWidgets,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //Container for Javascript collection
          Container(
            height: 250,
            width: 390,
            decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 120, top: 0, left: 20),
                      child: Image.asset(
                        "Images/udemy.png",
                        scale: 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 23,
                        left: 15,
                        right: 0,
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Javascript')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<Column> clientWidgets = [];
                          if (snapshot.hasData) {
                            final clients =
                                snapshot.data?.docs.reversed.toList();
                            for (var client in clients!) {
                              final clientWidget = Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 150),
                                    child: GestureDetector(
                                      onTap: () {
                                        launchUrlString(
                                            "https://www.udemy.com/course/the-complete-javascript-course/");
                                      },
                                      child: Text(
                                        client['courseName'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 90),
                                    child: Text(
                                      client['UniName'],
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 215),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.green,
                                      ),
                                      // color: Colors.green,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star_half,
                                            color: Colors.white,
                                          ),
                                          const Text(
                                            "4.5  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 205),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.monetization_on_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Fees'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 219),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_on_sharp),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Location'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 195),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.work_outline_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Method'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 176),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.timer_outlined),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            client['Duration'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              clientWidgets.add(clientWidget);
                            }
                          }
                          return Row(
                            children: clientWidgets,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //Container for Data science collection
          Container(
            height: 250,
            width: 390,
            decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 120, top: 0, left: 20),
                      child: Image.asset(
                        "Images/coursera.jpeg",
                        scale: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 23,
                        left: 15,
                        right: 0,
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Data Science')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<Column> clientWidgets = [];
                          if (snapshot.hasData) {
                            final clients =
                                snapshot.data?.docs.reversed.toList();
                            for (var client in clients!) {
                              final clientWidget = Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 135),
                                    child: GestureDetector(
                                      onTap: () {
                                        launchUrlString(
                                            "https://www.coursera.org/degrees/master-of-applied-data-science-umich");
                                      },
                                      child: Text(
                                        client['courseName'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 75),
                                    child: Text(
                                      client['UniName'],
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 210),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.green,
                                      ),
                                      // color: Colors.green,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star_half,
                                            color: Colors.white,
                                          ),
                                          const Text(
                                            "4.5  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 195),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.monetization_on_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Fees'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 217),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_on_sharp),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Location'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 195),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.work_outline_rounded),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            client['Method'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 170),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.timer_outlined),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            client['Duration'],
                                            overflow: TextOverflow.ellipsis,
                                            // softWrap: false,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              clientWidgets.add(clientWidget);
                            }
                          }
                          return Row(
                            children: clientWidgets,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
        // ),
        // ],
      ),
      // )
      // bottomNavigationBar: BottomNavigationBar(
      //   // currentIndex: _currentIndex,
      //   // onTap: onTapped,
      //   // type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.blueAccent,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore_rounded),
      //       label: 'Explore',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add_box_rounded),
      //       label: 'Contribute',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.card_giftcard_rounded),
      //       label: 'Rewards',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: (setValue) {
      //     _selectedIndex = setValue;
      //   },
      // ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    Object? newValue = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 200, 50, 50),
      items: <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Option 1',
          child: Text('Option 1'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 2',
          child: Text('Option 2'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 3',
          child: Text('Option 3'),
        ),
      ],
      // initialValue: value
    );
    if (newValue != null) {
      setState(() {
        //  value = newValue;
      });
    }
  }
}

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
          return const Text("Loading");
        }));
  }
}


//firebase fetch 
// Padding(
                //   padding: const EdgeInsets.only(left: 20, right: 0),
                //   child:
                // Row(
                //   children: [
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection('Courses')
                //       .snapshots(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Text("Loading... Please wait!");
                //     }
                //     return Column(
                //       children: [
                //         Text(snapshot.data?.docs[0]['courseName']),
                //         // snapshot.data?.docs[0]['courseName'],
                //       ],
                //     );
                //   },
                // )

                // StreamBuilder<QuerySnapshot>(
                //   stream: FirebaseFirestore.instance
                //       .collection('Courses')
                //       .snapshots(),
                //   builder: (context, snapshot) {
                //     List<Column> clientWidgets = [];
                //     if (snapshot.hasData) {
                //       final clients = snapshot.data?.docs.reversed.toList();
                //       for (var client in clients!) {
                //         final clientWidget = Column(
                //           children: [
                //             Text(
                //               client['courseName'],
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 17),
                //             ),
                //             SizedBox(
                //               height: 20,
                //             ),
                //             Text(
                //               client['courseSummary'],
                //               overflow: TextOverflow.ellipsis,
                //               // softWrap: false,
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 10),
                //             ),

                //             // Text(client['Fees']),
                //           ],
                //         );
                //         clientWidgets.add(clientWidget);
                //       }
                //     }
                //     return Column(
                //       children: clientWidgets,
                //     );
                //   },
                // ),

                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection("Courses")
                //       .snapshots(),
                //   // builder: (context, snapshot) {},
                //   builder: (context, snapshot) {
                //     return !snapshot.hasData
                //         ? Text('PLease Wait')
                //         : ListView.builder(
                //             itemCount: snapshot.data?.docs.length,
                //             itemBuilder: (context, index) {
                //               QueryDocumentSnapshot<
                //                       Map<String, dynamic>>? course =
                //                   snapshot.data?.docs[index];
                //               return CourseItem(
                //                 name: course!['courseName'],
                //                 // imageUrl: course['imageURL'],
                //                 // price: course['price'],
                //                 // discription: course['description'],
                //               );
                //             },
                //           );
                //   },
                // ),
                // )
                // ElevatedButton(
                //     onPressed: () async {
                //       DocumentSnapshot _ds = await FirebaseFirestore
                //           .instance
                //           .collection("Courses")
                //           .doc('qZpSGknh38F2J9gEvdjH')
                //           .get();
                //       Object? mapEventData = _ds.data();
                //       final field = _ds.data;
                //       print(mapEventData);
                //     },
                //     child: Text("Print")),

                // Text(GetData(docuId: docIDs.)),
                //   ],
                // ),
                // ),
