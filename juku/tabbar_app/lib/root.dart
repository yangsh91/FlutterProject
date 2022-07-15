import 'package:flutter/material.dart';
import 'package:tabbar_app/first.dart';
import 'package:tabbar_app/second.dart';

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
        color: Colors.yellowAccent,
        height: 70.0,
        child: TabBar(
          controller: _controller,
          labelColor: Colors.redAccent,
          //indicator: BoxDecoration(color: Colors.redAccent),
          indicatorColor: Colors.redAccent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blueAccent,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
