import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('AppBar Test'),
        centerTitle: true,
      ),
      */
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('AppBar'),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Flexible AppBar',
                style: TextStyle(fontSize: 14.0),
              ),
              background: Image.asset(
                'assets/images/nezuko.jpeg',
                fit: BoxFit.cover,
              ),
              centerTitle: false,
              collapseMode: CollapseMode.none,
            ),
            pinned: true,
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.305,
            centerTitle: true,
            leading: Icon(Icons.menu_rounded),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 950,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: Center(
                  child: Text(
                    'Scroll',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
