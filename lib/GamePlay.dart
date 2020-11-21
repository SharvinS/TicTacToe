//Import files
import "package:flutter/material.dart";
import 'dart:math';

//Easy class which is a stateful widget
class GamePlay extends StatefulWidget {
  @override
  _GamePlay createState() => _GamePlay();
}

//user landing class
class _GamePlay extends State<GamePlay> {

  //declaring variables
  var bList = ["","","","","","","","",""];   //list of empty string
  var random = new Random();    //generate random number
  var temp;   //hold temporary random number
  bool computer;    //the change of value upon computer move

  //variable representing text in button
  var button1;var button2;var button3;
  var button4;var button5;var button6;
  var button7;var button8;var button9;
  //holds string "X" & "O"
  var X="X";
  var O="O";

  var done = 0;   //to determine if the game is over

  //function to add text into button using list
  void add(){
    button1 = bList[0];button2 = bList[1];button3 = bList[2];
    button4 = bList[3];button5 = bList[4];button6 = bList[5];
    button7 = bList[6];button8 = bList[7];button9 = bList[8];
  }

  //to check results
  void checkresult() {
    //check win condition for human player
    if ((bList[0]==X&&bList[3]==X&&bList[6]==X)||
        (bList[1]==X&&bList[4]==X&&bList[7]==X)||
        (bList[2]==X&&bList[5]==X&&bList[8]==X)||
        (bList[0]==X&&bList[1]==X&&bList[2]==X)||
        (bList[3]==X&&bList[4]==X&&bList[5]==X)||
        (bList[6]==X&&bList[7]==X&&bList[8]==X)||
        (bList[0]==X&&bList[4]==X&&bList[8]==X)||
        (bList[2]==X&&bList[4]==X&&bList[6]==X)){
      done++;   //to determine if the game is over

      // flutter defined function
      //pop-up to show human player won
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
                backgroundColor: Colors.white54,
                title: new Text("Congratulations!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Times New Roman",
                  color: Colors.black),),
                content:
                new Text("You won the game",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Times New Roman",
                      color: Colors.black),),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new RaisedButton(
                    elevation: 5.0,
                    color: Colors.blue[800],
                    child: new Text("Close",
                      style: TextStyle(fontFamily: "Times New Roman",
                          color: Colors.black),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]
            );
          }
      );
    }

    //check win condition for computer
    else if ((bList[0]==O&&bList[3]==O&&bList[6]==O)||
        (bList[1]==O&&bList[4]==O&&bList[7]==O)||
        (bList[2]==O&&bList[5]==O&&bList[8]==O)||
        (bList[0]==O&&bList[1]==O&&bList[2]==O)||
        (bList[3]==O&&bList[4]==O&&bList[5]==O)||
        (bList[6]==O&&bList[7]==O&&bList[8]==O)||
        (bList[0]==O&&bList[4]==O&&bList[8]==O)||
        (bList[2]==O&&bList[4]==O&&bList[6]==O)) {
      done++;   //to determine if the game is over

      // flutter defined function
      //pop-up to show computer won
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
                backgroundColor: Colors.white54,
                title: new Text("Try again!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Times New Roman",
                      color: Colors.black),),
                content: new Text("Computer won the game",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Times New Roman",
                      color: Colors.black),),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new RaisedButton(
                    elevation: 5.0,
                    color: Colors.blue[800],
                    child: new Text("Close",
                      style: TextStyle(fontFamily: "Times New Roman",
                          color: Colors.black),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]
            );
          }
      );
    }

    //check draw condition
    else if (bList.contains("")==false){

      // flutter defined function
      //pop-up to show game draw
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              backgroundColor: Colors.white54,
                title: new Text("It's a draw!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Times New Roman",
                      color: Colors.black),),
                content: new Text("Try harder next time",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Times New Roman",
                      color: Colors.black),),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new RaisedButton(
                    elevation: 5.0,
                    color: Colors.blue[800],
                    child: new Text("Close",
                      style: TextStyle(fontFamily: "Times New Roman",
                          color: Colors.black),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]
            );
          }
      );
    }
  }


  //called OnPressed
  void play(int z){

    //human turn
    computer = false;

    if(done==0&&bList[z-1]==""){

        bList[z-1]="X";
        checkresult();

      //computer random move
      while(done==0&&computer==false) {
        temp = random.nextInt(9);
        if (bList[temp] == "") {
          bList[temp] = "O";
          computer = true;
        }
        if (bList.contains("")==false){
          computer = true;
        }
        checkresult();
      }
    }
  }

  //runs function when the page starts
  @override
  void initState(){
    add();
  }

  //overriding StatelessWidget class to allow manipulation
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(   //create an empty whole page which is the main layout
            appBar: AppBar(   //create an app bar for the page
              backgroundColor: Colors.blue[800],    //color of the app bar
              title: Text("Tic-Tac-Toe",   //text displayed on the app bar
                  style: new TextStyle(fontFamily: "Times New Roman")   //the font style of the text
              ),
            ),
            body: new Material(   //the body of the homepage
                child: new Container(   //contains all the content of the page body
                    padding: new EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),    //the spacing between border and container
                    color: Colors.grey[900],    //background color of the page
                    child: new Column(    //column to insert item
                        mainAxisAlignment: MainAxisAlignment.center,    //alignment of the column
                        children: [   //holds widgets for the previous widgets
                          new Container(  //create container to insert text
                            child: new Row(   //row to insert image
                              mainAxisAlignment: MainAxisAlignment.center,    //alignment of the row
                              children: [   //holds widgets for the previous widgets
                                new Padding(padding: EdgeInsets.only(bottom: 50.0)),    //distance between border and text
                                Text("GOOD LUCK !",    //insertion of text
                                  style: TextStyle(fontSize: 23.0,    //size of the text
                                      fontFamily: 'Times New Roman',   //font style of the text
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),

                          new Padding(padding: EdgeInsets.only(top: 50.0)),   //spacing above the image

                          //start of the first row of button
                          new Container(    //container to create first row a button
                            child: new Row(   //the row to hold the buttons
                              mainAxisAlignment: MainAxisAlignment.center,    //alignment of the row
                              children: [   //holds widgets for the previous widgets

                                //start of first button of first row
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {
                                            play(1);
                                            add();
                                            setState(() {
                                            });
                                          },
                                          child: Text(button1,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))

                                      ),
                                    )
                                ),

                                //start of second button of first row, please refer to first button of first row
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {
                                            play(2);
                                            add();
                                            setState(() {
                                            });
                                          },
                                          child: Text(button2,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),

                                //start of third button of first row, please refer to first button of first row
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {play(3);
                                          add();
                                          setState(() {
                                          });
                                          },
                                          child: Text(button3,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),

                          //start of the second row of button, please refer to first row of button
                          new Container(
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {play(4);
                                          add();
                                          setState(() {
                                          });
                                          },
                                          child: Text(button4,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {play(5);
                                          add();
                                          setState(() {
                                          });
                                          },
                                          child: Text(button5,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {play(6);
                                          add();
                                          setState(() {
                                          });
                                          },
                                          child: Text(button6,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),

                          //start of the third row of button, please refer to first row of button
                          new Container(
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {play(7);
                                          add();
                                          setState(() {
                                          });
                                          },
                                          child: Text(button7,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {play(8);
                                          add();
                                          setState(() {
                                          });
                                          },
                                          child: Text(button8,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),
                                new Container(    //container to hold the first button
                                    padding: new EdgeInsets.all(10.0),    //spacing between border and content
                                    child: new Material(    //allows creation and  customization of a widget
                                      elevation: 5.0,   //elevation value of the widget
                                      color: Colors.blue[800],    //color of the widget
                                      child: MaterialButton(    //the size of the box to create button
                                          minWidth: 80.0,
                                          height: 80.0,
                                          //action upon clicking the button
                                          onPressed: () {play(9);
                                          add();
                                          setState(() {
                                          });
                                          },
                                          child: Text(button9,
                                              textAlign: TextAlign.center,
                                              //customizing text style ie: font, font size, color of font and font weight
                                              style: new TextStyle(
                                                fontFamily: "Times New Roman",
                                                fontSize: 25,
                                                color: Colors.black,
                                              ))
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),

                          new Padding(padding: EdgeInsets.only(top: 50.0)),   //spacing above the image

                          //start of the back button
                          new Container(    //container to create a button
                              padding: EdgeInsets.only(top: 60.0),    //spacing above the back button
                              child: new Row(   //create row to allow alignment of button
                                  mainAxisAlignment: MainAxisAlignment.start,   //alignment of the row
                                  children: [   //holds widgets for the previous widgets
                                    new Container(    //holds the back button
                                      padding: new EdgeInsets.all(10.0),    //distance between container and border
                                      child: new Material(    //allows creation and  customization of a widget
                                        borderRadius: new BorderRadius.circular(25.0),    //curve edges of the widget
                                        elevation: 10.0,      //elevation value of the widget
                                        color: Colors.blue[800],    //color of the widget
                                        child: MaterialButton(    //create a button within the material
                                          minWidth: 80.0,   //width of the button
                                          height: 20.0,   //height of the button
                                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),   // distance from text and border

                                          //action upon clicking the button which navigates to the homepage
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Back",   //text displayed on the button
                                              textAlign: TextAlign.center,    //alignment of the text
                                              style: new TextStyle(   //styling of the text
                                                  fontFamily: "Times New Roman"   //font style of the text
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                        ]
                    )
                )
            )
        )

    );
  }
}
