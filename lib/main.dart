import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String activeCase = 'null';
  String deathCase = 'null';
  String tanggal = 'null';

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse('https://data.covid19.go.id/public/api/update.json'));

      // untuk cek data
      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);

        setState(() {
          tanggal = data['update']['penambahan']['tanggal'];
          activeCase = data['update']['penambahan']['jumlah_positif'].toString();
          deathCase = data['update']['penambahan']['jumlah_meninggal'].toString();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text(
          'COVID-19 VIRUS TRACKER',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 40,
            width: 40,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2019/01/13/01/45/muslim-3929666_960_720.png"),
            ),
            title: Text(
              "Dini Adistia",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text('Status Aktif'),
            contentPadding: EdgeInsets.only(left: 30, bottom: 10, top: 10),
          ),
          ListTile(
            leading: Image.asset("assets/images/hospital.png"),
            title: Text("Quarantine Centers"),
            contentPadding: EdgeInsets.only(top: 50, bottom: 20, left: 20),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/images/medicine 1.png"),
            title: Text("Medicine"),
            contentPadding: EdgeInsets.all(20),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/images/care.png"),
            title: Text("Symptoms"),
            contentPadding: EdgeInsets.all(20),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/images/help1.png"),
            title: Text("Volunteer"),
            contentPadding: EdgeInsets.all(20),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/images/operator.png"),
            title: Text("Live Support"),
            contentPadding: EdgeInsets.only(top: 10, bottom: 100, left: 20),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting      |        Log Out"),
            contentPadding: EdgeInsets.all(10),
            onTap: () {},
          ),
        ],
      )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green[50]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CURRENT STATS  ^',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'REPORTED',
                              ),
                              Text(
                                'CASES',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset('assets/images/virus.png'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activeCase,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'REPORTED',
                              ),
                              Text(
                                'DEATHS',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset('assets/images/racun.png'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                deathCase,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green[50]),
                  child: Column(
                    children: [
                      Text('Corona Virus Measures To Take', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Stay aware of the latest measures'),
                      Text('to prevent COVID-19 outbreak'),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/Group.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Wear a facemask',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blue[200]),
                                    child: Text('See more ->'),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('You should always wear a facemask'),
                              Text('when you are around other people'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            height: 170,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue[100]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/italia.png'),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Italy',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' - 74.386 infected cases reported',
                          ),
                          Text(
                            ' - 7.503 death cases reported',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/bendera.png'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.green[200], borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/home.png'),
                Image.asset('assets/images/news 2.png'),
                Image.asset('assets/images/Group2.png'),
                Image.asset('assets/images/pengguna.png')
              ],
            ),
          )
        ]),
      ),
    );
  }
}
