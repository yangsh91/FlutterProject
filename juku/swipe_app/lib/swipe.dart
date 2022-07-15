import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Swipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwipeState();
}

class SwipeState extends State<Swipe> {
  late List imageName;
  int currentImage = 0;

  @override
  void initState() {
    imageName = [
      'assets/images/flower_01.png',
      'assets/images/flower_02.png',
      'assets/images/flower_03.png',
      'assets/images/flower_04.png',
      'assets/images/flower_05.png',
      'assets/images/flower_06.png',
    ];
    super.initState();
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        currentImage++;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        if (currentImage > 0) {
          currentImage--;
        }
      }
    });
  }

  void _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.up) {
        currentImage++;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        if (currentImage > 0) {
          currentImage--;
        }
      }
    });
  }

  void _onButtonSwipe(String type) {
    setState(() {
      if (type == 'next') {
        if (currentImage < 5) {
          currentImage++;
        } else {
          _showSnackBar('마지막 사진 입니다.');
        }
      } else {
        if (currentImage > 0) {
          currentImage--;
        } else {
          _showSnackBar('첫번째 사진 입니다.');
        }
      }
    });
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SWIPE APP'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(imageName[currentImage]),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SimpleGestureDetector(
              onHorizontalSwipe: _onHorizontalSwipe,
              onVerticalSwipe: _onVerticalSwipe,
              swipeConfig: const SimpleSwipeConfig(
                verticalThreshold: 40.0,
                horizontalThreshold: 40.0,
                swipeDetectionBehavior:
                    SwipeDetectionBehavior.continuousDistinct,
              ),
              child: Container(
                height: 600.0,
                color: Colors.amber,
                child: Image.asset(
                  imageName[currentImage],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _onButtonSwipe('prev'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                    child: Text('<< 이전'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () => _onButtonSwipe('next'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                    child: Text('다음 >>'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
