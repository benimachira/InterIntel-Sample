import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intertel_interview/model_todo.dart';
import 'package:http/http.dart' as http;

class ScreenResponse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<ModelToDo>>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else if (snapshot.hasData) {
                List<ModelToDo> a = [];
                List<ModelToDo>? facilitators = snapshot.data ?? a;
                if (facilitators.isNotEmpty) {
                  return ListView.builder(
                      itemCount: facilitators.length,
                      itemBuilder: (context, index) {
                        ModelToDo todo = facilitators[index];
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${todo.id}. ${todo.title}',style: TextStyle(fontSize: 15),),
                              SizedBox(height: 4,),
                              Text('${todo.completed}',style: TextStyle(color: Colors.grey),),
                              SizedBox(height: 8,),
                              Divider(
                                height: 2.0,
                              ),
                              SizedBox(height: 8,),
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No facilitators added yet'),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<List<ModelToDo>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=5'));
    if (response.statusCode == 200) {
      print('AAA${response.body}');
      final List parsedList = json.decode(response.body);
      List<ModelToDo> _model = parsedList.map((val) =>  ModelToDo.fromapi(val)).toList();
      return _model;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
