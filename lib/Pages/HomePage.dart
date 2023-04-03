import 'package:anim_search_app_bar/anim_search_app_bar.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  // margin: EdgeInsets.only(bottom: 750),
                  child: AppBar(
                    leading: Icon(Icons.image),
                    // shadowColor: Colors.grey,
                    elevation: 0.1,
                    backgroundColor: Colors.white,
                    title: const Text(
                      "Courses",
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Expanded(
                          child: VerticalDivider(
                            thickness: 1,
                            indent: 12,
                            endIndent: 12,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color.fromARGB(255, 86, 112, 251),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Expanded(
                          child: VerticalDivider(
                            thickness: 1,
                            indent: 12,
                            endIndent: 12,
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        // color: Colors.black,
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onSelected: (String result) {
                          // Do something when a menu item is selected
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'option1',
                            child: Text('Option 1'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'option2',
                            child: Text('Option 2'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'option3',
                            child: Text('Option 3'),
                          ),
                        ],
                      ),
                      // );
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                child: Column(children: [
                  Material(
                    shadowColor: Color.fromARGB(255, 246, 247, 255),
                    elevation: 4,
                    borderRadius: BorderRadius.circular(30),
                    child: TextFormField(
                      // controller: emailcontroller,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        prefixIconColor: Colors.grey,
                        hintText: "Search",
                        // border: BorderRadius.circular(10),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        // fillColor: Colors.grey.shade100,
                        // filled: true,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
