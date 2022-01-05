// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ทำความรู้จักกับ IZ*ONE"),
      ),
      body: Padding(
          padding: EdgeInsets.all(30),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(
                      snapshot.data[index]['title'],
                      snapshot.data[index]['subtitle'],
                      snapshot.data[index]['image_url'],
                      snapshot.data[index]['detail'],
                      snapshot.data[index]['image_etc']);
                },
                itemCount: snapshot.data.length,
              );
            },
            future: getData(),
            // future:
            //     DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget MyBox(String title, String subtitle, String image_url, String detail,
      String image_etc) {
    var v1, v2, v3, v4, v5;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
    v5 = image_etc;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(40),
      //color: Colors.blue[50],
      height: 190,
      // decoration ส่วนตกเเต่ง
      decoration: BoxDecoration(
        //color: Colors.blue[50],
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.15), BlendMode.darken)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 7),
          TextButton(
              onPressed: () {
                print("Next Page >>");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              v1,
                              v2,
                              v3,
                              v4,
                              v5,
                            )));
              },
              child: Text(
                "อ่านต่อ",
                style: TextStyle(color: Colors.purpleAccent[700]),
              ))
        ],
      ),
    );
  }

  Future getData() async {
    // https://raw.githubusercontent.com/ticktahod/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/ticktahod/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
