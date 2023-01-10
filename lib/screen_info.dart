import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intertel_interview/screen_design.dart';
import 'package:intertel_interview/screen_dictionary.dart';
import 'package:intertel_interview/screen_response.dart';

import 'DrawerItems.dart';

class ScreenInfo extends StatefulWidget {
  @override
  State<ScreenInfo> createState() => _ScreenInfoState();
}

class _ScreenInfoState extends State<ScreenInfo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _name_controller = TextEditingController();
  var _email_controller = TextEditingController();
  var _phone_controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: AppBar(title: Text('Info'),),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 32,),
              TextFormField(
                controller: _name_controller,
                decoration: new InputDecoration(
                  hintText: 'Enter name',
                  contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 32,),
              TextFormField(
                controller: _email_controller,
                decoration: InputDecoration(
                  hintText: 'Enter email address',
                  contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 32,),
              TextFormField(
                maxLength: 14,
                controller: _phone_controller,
                decoration: new InputDecoration(
                  hintText: 'Enter Phone number',
                  contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 32,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white),

                      onPressed: () {

                        String name = _name_controller.text;
                        String email = _email_controller.text;
                        String phone = _phone_controller.text;

                        if (name.isEmpty) {

                          show_toast(
                              'Enter name to proceed');
                          return;
                        }
                        if (email.isEmpty) {
                          show_toast(
                              'Enter email to proceed');
                          return;
                        }
                        if (phone.isEmpty) {
                          show_toast(
                              'Enter phone number to proceed');
                          return;
                        }
                        Map data={'name':name,'email':email,'phone':phone};
                        _name_controller.text='';
                        _phone_controller.text='';
                        _email_controller.text='';


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenDesign(data),
                          ),
                        );
                      },
                      // color: HexColor('#0F305E'),
                      // textColor: Colors.white,
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void show_toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  Widget _drawer() {

    var drawerItems = DrawerItems.drawerItems;

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              color: Colors.green,
            ),
            height: 264,
            width: double.infinity,
            margin: EdgeInsets.only(left: 4, right: 4),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();

                  },
                  child: Container(
                    width: 54,
                    height: 54,
                    padding: EdgeInsets.all(12),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.grey, // red as border color
                          width: .2),
                    ),
                    child: Image.asset(
                      'assets/images/default_avatar.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),
                Text(
                  'InterIntel Interview',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2,
                ),
                // Text(
                //   "0728492268",
                //   style: TextStyle(fontSize: 13, color: Colors.white),
                // ),
                Text(
                  'benimachira@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Scrollbar(
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (BuildContext context, int index) {
                  Map item = drawerItems[index];
                  return _item(item, index);
                },
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget _item(Map item, int index) {

    return ListTile(
      leading: Icon(
        item['icon'],
        size: 24,
        color: Colors.green,
      ),
      subtitle: _text(item),
      title: _title( item),
      onTap: () {
        _closeDrawer();

        if (index == 0) {
          // _scaffoldKey.currentState?.openEndDrawer();
          Map data={'name':'Benson Machira','email':'benimachira@gmail.com','phone':'0728492268'};


          Navigator.of(context).push(_createRoute(ScreenDesign(data)));


          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ScreenDesign(data),
          //   ),
          // );
        } else if (index == 1) {
          Navigator.of(context).push(_createRoute(ScreenResponse()));

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ScreenResponse(),
          //   ),
          // );

          // Navigator.pop(context);
        }else if (index == 2) {
          Navigator.of(context).push(_createRoute(ScreenDictionary()));

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ScreenDictionary(),
          //   ),
          // );
        }
      },
    );
  }

  Widget _title(item) {

    return Text(
      '${item['name']}',
      style: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
    );

  }

  Widget _text(item) {
    return Text(
      '${item['description']}',
      style: TextStyle(fontSize: 11, color: Colors.grey),
    );


  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  Route _createRoute(Widget x) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  x,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
