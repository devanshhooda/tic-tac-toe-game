
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _title = "Tic - Tac - Toe";
  String cross = 'X', zero = 'O', message;
  bool isCross = true;
  List<String> gameState;

  AssetImage cI = AssetImage('assets/circle.png');
  AssetImage zI = AssetImage('assets/circle.png');
  AssetImage e = AssetImage('assets/circle.png');

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ];
      this.message = "";
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case '':
        return e;
        break;
      case 'X':
        return cI;
        break;
      case 'O':
        return zI;
        break;
    }
  }

  playGame(int i) {
    if (this.gameState[i] == "") {
      setState(() {
        if (this.isCross) {
          this.gameState[i] = zero;
        } else {
          this.gameState[i] = cross;
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  checkWin() {
    if (this.gameState[0] != '' &&
            (this.gameState[0] == this.gameState[1] &&
                this.gameState[1] == this.gameState[2]) ||
        (this.gameState[0] == this.gameState[4] &&
            this.gameState[4] == this.gameState[8]) ||
        (this.gameState[0] == this.gameState[3] &&
            this.gameState[3] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} Won !';
        this.delay();
      });
    } else if ((this.gameState[3] != '' &&
        this.gameState[3] == this.gameState[4] &&
        this.gameState[5] == this.gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} Won !';
        this.delay();
      });
    } else if ((this.gameState[6] != '' &&
        this.gameState[6] == this.gameState[7] &&
        this.gameState[8] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} Won !';
        this.delay();
      });
    } else if ((this.gameState[1] != '' &&
        this.gameState[1] == this.gameState[4] &&
        this.gameState[4] == this.gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} Won !';
        this.delay();
      });
    } else if ((this.gameState[2] != '' &&
            this.gameState[2] == this.gameState[5] &&
            this.gameState[5] == this.gameState[8]) ||
        (this.gameState[2] == this.gameState[4] &&
            this.gameState[4] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} Won !';
        this.delay();
      });
    }
  }

  delay(){
    Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
     this.resetGame(); 
    });
  }

  resetGame() {
    setState(() {
      gameState = [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ];
      this.message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        theme: ThemeData.dark(),
        home: new Scaffold(
          drawer: new Drawer(),
          appBar: new AppBar(
            centerTitle: true,
            title: new Text(
              _title,
              style: new TextStyle(
                fontSize: 25,
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: new ListView(children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('0'),
                      onPressed: () => this.playGame(0),
                      child: Image(image: getImage(this.gameState[0])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('1'),
                      onPressed: () => this.playGame(1),
                      child: Image(image: getImage(this.gameState[1])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('2'),
                      onPressed: () => this.playGame(2),
                      child: Image(image: getImage(this.gameState[2])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('0'),
                      onPressed: () => this.playGame(3),
                      child: Image(image: getImage(this.gameState[3])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('1'),
                      onPressed: () => this.playGame(4),
                      child: Image(image: getImage(this.gameState[4])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('2'),
                      onPressed: () => this.playGame(5),
                      child: Image(image: getImage(this.gameState[5])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('0'),
                      onPressed: () => this.playGame(6),
                      child: Image(image: getImage(this.gameState[6])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('1'),
                      onPressed: () => this.playGame(7),
                      child: Image(image: getImage(this.gameState[7])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
                new Container(
                  child: new Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 3)),
                    child: new MaterialButton(
                      // onPressed: () => print('2'),
                      onPressed: () => this.playGame(8),
                      child: Image(image: getImage(this.gameState[8])),
                    ),
                  ),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.only(left: 2, top: 3),
                ),
              ],
            ),
            new Center(
                child: new Container(
              child: new Text(
                '${this.message}',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              padding: EdgeInsets.all(15),
            )),
            new Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: new IconButton(
                onPressed: () => resetGame(),
                icon: Icon(Icons.refresh),
                color: Colors.white,
                iconSize: 80,
              ),
            )
          ]),
        ));
  }
}
