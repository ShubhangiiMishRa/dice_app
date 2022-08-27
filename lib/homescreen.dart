import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int leftDice = 1;
  int rightDice = 2;
  void _roll(){
    setState(() {
      leftDice = Random().nextInt(5)+1;
      rightDice = Random().nextInt(5)+1;
    });
  }
  late AnimationController _controller;
  @override
  // void initState(){
  //   super.initState();
  //   _controller = AnimationController(duration: Duration(seconds: 5), vsync: this );
  //   _controller.forward();
  //   _controller.addListener(() { print(_controller.value );});
  //   _controller.addStatusListener((status) {
  //     if(status==AnimationStatus.completed);
  //   });
  // }
  // @override
  // void dispose(){
  //   super.dispose();
  //   _controller.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice App',
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 60,
            // ),
            Row(
              children:  [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: _roll,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('images/dice_$leftDice.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _roll,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('images/dice_$rightDice.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ButtonTheme(
              minWidth: 100,
              child: OutlinedButton(
                // borderSide: BorderSide(
                //   color: Colors.transparent,
                //   style: BorderStyle.solid,
                //   width: 1,
                // ),
                onPressed: _roll,
                child: Text(
                  ' ROLL ',
                  selectionColor: Colors.black,
                  style: TextStyle(
                    color: Colors.red,
                    backgroundColor: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
