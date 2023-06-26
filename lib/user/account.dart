import 'package:flutter/material.dart';
import 'package:projefct/main.dart';
import 'package:projefct/user/trcking/track.dart';
import 'package:projefct/Admin/adminlogin.dart';

class AdditionalInformation extends StatefulWidget {
  // const AdditionalInformation({super.key, required this.title});

  // final String title;

  @override
  State<AdditionalInformation> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AdditionalInformation> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Account',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            onPressed: () {
              // // Perform search action
              // // final searchQuery = _searchController.text;
              // print('Search Query: $searchQuery');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60, // Adjust the radius as needed
                  backgroundImage: AssetImage(
                      'assets/images/avatar.png'), // Replace with your own image path
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'sebastian joseph',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '+918157966506',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.black),
                      title: Text(
                        'Edit profile',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city, color: Colors.black),
                      title: Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.notification_add, color: Colors.black),
                      title: Text(
                        'Admin',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login1()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shield, color: Colors.black),
                      title: Text(
                        'Privcay policy',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.book, color: Colors.black),
                      title: Text(
                        'Terms & conditons',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black54),
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.add_box, color: Colors.black),
                      title: Text(
                        'My orders',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductTrackingPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('log out'),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
