// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jua Ni Mtandao Gani',
      debugShowCheckedModeBanner: false,
      home: StorageUpload(),
    );
  }
}

class StorageUpload extends StatefulWidget {
  @override
  StorageUploadState createState() => StorageUploadState();
}

class StorageUploadState extends State<StorageUpload> {
  List results = [];

  var rows = [];
  String query = '';
  TextEditingController? tc;

  @override
  void initState() {
    super.initState();
    tc = TextEditingController();
    rows = [
      {
        'contact_name': 'Airtel',
        'contact_phone': '068 069 078',
      },
      {
        'contact_name': 'Vodacom',
        'contact_phone': '074 075 076',
      },
      {
        'contact_name': 'Tigo',
        'contact_phone': '065 067 071',
      },
      {
        'contact_name': 'TTCL',
        'contact_phone': '073 ',
      },
      {
        'contact_name': 'Halotel',
        'contact_phone': '062',
      },
      {
        'contact_name': 'Ammotel',
        'contact_phone': '063',
      },
      {
        'contact_name': 'Cootel',
        'contact_phone': '064',
      },
      {
        'contact_name': 'Smile',
        'contact_phone': '066',
      },
      {
        'contact_name': 'Zantel',
        'contact_phone': '077',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      // ignore: unnecessary_new
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Jua Mtandao wa simu",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.pink,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.phone_iphone, size: 40),
                    title: Text('Mtandao', style: TextStyle(fontSize: 23.0)),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: tc,
                          decoration: InputDecoration(hintText: 'Search...'),
                          onChanged: (v) {
                            setState(() {
                              query = v;
                              setResults(query);
                            });
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.white,
                        child: query.isEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: rows.length,
                                itemBuilder: (con, ind) {
                                  return ListTile(
                                    // title: Text(rows[ind]['contact_name']),
                                    // subtitle: Text(rows[ind]['contact_phone']),
                                    onTap: () {
                                      setState(() {
                                        tc?.text = rows[ind]['contact_name'];
                                        query = rows[ind]['contact_name'];
                                        setResults(query);
                                      });
                                    },
                                  );
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: results.length,
                                itemBuilder: (con, ind) {
                                  return ListTile(
                                    title: Text(results[ind]['contact_name']),
                                    // subtitle: Text(results[ind]['contact_phone']),
                                    onTap: () {
                                      setState(() {
                                        tc?.text = results[ind]['contact_name'];
                                        query = results[ind]['contact_name'];
                                        setResults(query);
                                      });
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Text('Welcome'),
            ),
            ListTile(
              title: const Text('Rate us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Download other apps'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void setResults(String query) {
    results = rows
        .where((elem) =>
            elem['contact_name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['contact_phone']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
  }
}
