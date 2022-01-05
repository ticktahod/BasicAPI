// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final v1, v2, v3, v4, v5;
  DetailPage(this.v1, this.v2, this.v3, this.v4, this.v5);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4, _v5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
    _v5 = widget.v5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              _v1,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              _v2,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            Image.network(
              _v5,
              width: 100,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(_v4)
          ],
        ),
      ),
    );
  }
}
