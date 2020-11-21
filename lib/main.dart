//Import files
import 'package:flutter/material.dart';
import 'package:tictactoe_test/GamePlay.dart';

void main() => runApp(MyApp());

//Class that directs back to the app homepage
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomeScreen());
  }
}

//User landing class
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold( //create an empty whole page which is the main layout
      appBar: AppBar(     //create an app bar for the homepage
          backgroundColor: Colors.blue[800],    //color of the app bar
          title: Text('Tic-Tac-Toe')    //text displayed on the app bar
      ),
      body: new Material(   //the body of the homepage
        child: new Container( //contains all the content of the page body
          padding: const EdgeInsets.all(30.0),    //the spacing between border and container
          color: Colors.grey[900],    //background color of the homepage
            child: new Center(    //the position of the container set to center
              child: new Column(children: [   //a column to insert item
                new Padding(padding: EdgeInsets.only(top: 50.0)),   //the distance between the app bar and column
                new Text(   //insertion of text in the column
                  'LET THE GAME BEGIN !',
                  style: new TextStyle(   //styling of the text
                      color: Colors.white,    //color of the text
                      fontSize: 25.0    //size of the text
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 50.0)),   //spacing above the image
                new Container(  //Container to insert an image.
                  child: Image.asset('assets/board1.png', width: 200.0, height: 200.0,    //insertion of image file
                  ),
                ),
                new Padding(padding: EdgeInsets.only(bottom: 250.0)), //spacing below the image

                //start of first button
                new Container(    //container for "EASY" button
                  padding: new EdgeInsets.all(10.0),    //the spacing between border and container
                  child: new Material(    //allows creation and  customization of a widget
                      elevation: 10.0,    //elevation value of the widget
                      borderRadius: new BorderRadius.circular(25.0),    //curve edges of the widget
                      color: Colors.blue[800],    //color of the widget
                      child: MaterialButton(    //create a button within the material
                          minWidth: 300.0,    //width of the button
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),   // distance from text and border

                          //action upon clicking the button which navigates to the assigned page
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => GamePlay()  //the destination page to navigate too
                              ),
                            );
                          },
                          child:  Text('START GAME',)   //text displayed on the button
                      )
                  ),
                ),
              ]),
            ),
          ),
        ),

    );
  }
}
