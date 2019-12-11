//without provider
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int dx = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return
         Scaffold(
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 50.0,
            ),
          ),
          appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Welcome to App Development Workshop")),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyFloatingActionButton(
                icon: Icon(Icons.add),
                onPressed: (){
                  setState(() {
                    if(width/2 + dx<width-1)
                      dx+=5;
                  });
                },
              ),
              SizedBox(
                width: 25.0,
              ),
              MyFloatingActionButton(
                icon: Icon(Icons.remove),
                onPressed: (){
                  setState(() {
                    if(width/2+dx>5)
                      dx-=5;
                  });
                },
              )
            ],
          ),
          body: Container(
              color: Colors.yellow,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.black,
                      width: (width/2 + dx),
                    ),
                    Expanded(
                      flex : 1 ,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                  ])),
        );
  }
}
class MyFloatingActionButton extends StatelessWidget
{
  Icon icon;
  Function onPressed;
  MyFloatingActionButton({this.icon,this.onPressed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      onPressed: onPressed,
      child:  icon,
    );
  }

}