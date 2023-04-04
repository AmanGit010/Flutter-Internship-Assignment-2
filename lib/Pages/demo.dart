import 'package:assignment_app/Pages/HomePage.dart';
import 'package:assignment_app/getData/getdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class demo extends StatefulWidget {
  demo({super.key});

  String _value = 'Option 1';
  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  int _currentIndex = 0;
  final search = "data";
  String _selectedValue = 'Option 1';
  List<String> _dropdownValues = ['Option 1', 'Option 2', 'Option 3'];

  List<dynamic> docIDs = [];
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Courses');

  Future getCourse() async {
    await FirebaseFirestore.instance.collection('Courses').get().then(
          (snapshot) => snapshot.docs.forEach(
            (course) {
              print(course.reference);
              print(course.data());
              docIDs.add(course.reference.id);
            },
          ),
        );
    // QuerySnapshot querySnapshot = await _collectionReference.get();
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    // print(allData);
  }

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Expanded(
              child: VerticalDivider(
                thickness: 1,
                indent: 12,
                endIndent: 12,
              ),
            ),
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Expanded(
              child: VerticalDivider(
                thickness: 1,
                indent: 12,
                endIndent: 12,
              ),
            ),
          ),
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
          // Expanded(
          //     child: FutureBuilder(
          //   future: getCourse(),
          //   builder: (context, snapshot) {
          //     return ListView.builder(
          //       itemCount: docIDs.length,
          //       itemBuilder: (context, index) {
          //         return ListTile(
          //           title: GetData(docuId: docIDs[index]),
          //         );
          //       },
          //     );
          //   },
          // )),
          // Container(
          //   child: Column(
          //     children: [
          //       Text(""),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
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
                  style: TextStyle(
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
          Container(
            height: 250,
            width: 390,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 140, top: 20),
                    child: Image.asset(
                      "Images/stan.png",
                      scale: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: Column(
                      children: [
                        Text(
                          "Get started with Flutter Development",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            width: 390,
            decoration: BoxDecoration(
              boxShadow: [
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Image.asset(
                        "Images/stan.png",
                        scale: 4,
                        fit: BoxFit.cover,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Get started with Flutter Development",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
              child: Column(
                children: [
                  Text("Get started with flutter development"),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
              child: Column(
                children: [
                  Text("Get started with flutter development"),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
              child: Column(
                children: [
                  Text("Get started with flutter development"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Material(
              shadowColor: Colors.grey,
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 170, vertical: 100),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: BoxShadow(
                  //   color: Colors.black
                  //   blurRadius: 4,
                  //   spreadRadius: .05,
                  // ),
                ),
                child: Row(
                  children: [
                    Text("Get started with Flutter Development"),
                  ],
                ),
                // ),
              ),
            ),
          ),
        ]),
        // ),
        // ],
      ),
      // )
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Contribute',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    Object? newValue = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, 200, 50, 50),
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
          return Text("Loading");
        }));
  }
}
