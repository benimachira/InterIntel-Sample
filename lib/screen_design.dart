import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenDesign extends StatefulWidget {

  Map? data;
  ScreenDesign(Map data){
    this.data= data;
  }

  @override
  State<ScreenDesign> createState() => _ScreenDesignState();
}

class _ScreenDesignState extends State<ScreenDesign>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController _anime_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const anime_duration = 2;

    _anime_controller = AnimationController(
        duration: const Duration(seconds: anime_duration),
        reverseDuration: Duration(seconds: anime_duration),
        vsync: this);
    animation = Tween<double>(begin: 50, end: 200).animate(_anime_controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _anime_controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _anime_controller.forward();
      }
    });
    _anime_controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Design'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(children: [
                      Text('${widget.data!['name']}',style: TextStyle(color: Colors.black,fontSize: 18),),
                    ],),
                    SizedBox(height: 8,),
                    Row(children: [
                      Text('Email: '),
                      Text('${widget.data!['email']}'),
                    ],),
                    SizedBox(height: 4,),
                    Row(children: [
                      Text('Phone: '),
                      Text('${widget.data!['phone']}'),
                    ],),

                  ],
                ),
              ),
            ),
            SizedBox(height: 32,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Some simple animation',style: TextStyle(color: Colors.grey),),
            ],),
            SizedBox(height: 8,),
            Card(child: Container(
              child:   AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Container(
                    height: animation.value,
                    width: animation.value,
                    child: Image.asset(
                      'assets/images/dash.jpg',
                      fit: BoxFit.fill,
                      height: animation.value,
                      width: animation.value,
                    ),
                  );
                },
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
