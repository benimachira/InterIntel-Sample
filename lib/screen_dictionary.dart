import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenDictionary extends StatefulWidget {
  @override
  State<ScreenDictionary> createState() => _ScreenDictionaryState();
}

class _ScreenDictionaryState extends State<ScreenDictionary> {
  Map<String, String> dictionary = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    'Ninety-Nine': '99',
    'nine-hundred': '900'
  };
  SplayTreeMap<String, String>? st;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sort_numeric();
  }



  @override
  Widget build(BuildContext context) {
    _sort_numeric();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: st?.length,
          itemBuilder: (BuildContext context, int index) {
            String? key = st?.keys.elementAt(index);
            return new Column(
              children: <Widget>[
                ListTile(
                  leading: new Text("$key"),
                  title: new Text("${st![key]}"),
                ),
                 Divider(
                  height: 2.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }



  _sort_numeric() {
    print('object');


     st = SplayTreeMap<String, String>();

    st?.addAll(dictionary);

    st?.forEach((k, v) => {
          if (isNumeric(k, v))
            {print("$k : ${st![k]}")}
          else
            {print("$v : ${st![k]}")}
        });
  }

  bool isNumeric(String k, String v) {
    if (k == null) {
      return false;
    }
    if (int.tryParse(k) == null) {
      return int.parse(v) != null;
    }
    return int.parse(k) != null;
  }
}
