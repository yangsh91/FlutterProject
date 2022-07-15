import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade900,
      appBar: AppBar(
        title: Text(
          '영웅 Card',
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              //width: 100,
              //height: 100,
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Lee.jpg'),
                radius: 70.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: Container(
              height: 2.0,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 5.0),
            child: Container(
              child: Text(
                '성웅',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            child: Container(
              child: Text(
                '이순신 장군',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 35.0, 0, 5.0),
            child: Container(
              child: Text(
                '전적',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0, 5.0),
            child: Container(
              child: Text(
                '62전 62승',
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.orange.shade400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0, 5.0),
            child: Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8, 0, 6.0),
                        child: Container(
                          child: Text('옥포해전'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 6.0),
                        child: Container(
                          child: Text('사천포해전'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 6.0),
                        child: Container(
                          child: Text('당포해전'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                        child: Container(
                          child: Text('한산도대첩'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                        child: Container(
                          child: Text('부산포해전'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                        child: Container(
                          child: Text('명량해전'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                        child: Container(
                          child: Text('노량해전'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 75.0,
            height: 75.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/turtle.gif'),
                //fit: BoxFit.fill
              ),
            ),
          ),
        ],
      ),
    );
  }
}
