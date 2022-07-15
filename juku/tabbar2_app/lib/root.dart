import 'package:flutter/material.dart';
import 'package:tabbar2_app/first.dart';
import 'package:tabbar2_app/second.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootState();
}

class RootState extends State<Root> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: [
          First(),
          Second(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 70.0,
        child: TabBar(
          controller: _controller,
          labelColor: Colors.blueAccent,
          //indicator: BoxDecoration(color: Colors.redAccent),
          indicatorColor: Colors.redAccent,
          indicatorWeight: 8.0,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.face_outlined,
                color: Colors.blueAccent,
              ),
              child: Text('first'),
            ),
            Tab(
              icon: Icon(
                Icons.info_outline,
                color: Colors.redAccent,
              ),
              child: Text('Second'),
            ),
          ],
        ),
      ),
    );
  }
}
