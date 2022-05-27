import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

const kExpandedHeight = 300.0;

class _HomeState extends State<Home> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  bool get _showTitle {
    print(_scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight);

    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: _showTitle ? Text('AppBar') : null,
            flexibleSpace: _showTitle
                ? null
                : FlexibleSpaceBar(
                    title: Text('_SliverAppBar'),
                    background: Image.asset(
                      'assets/images/nezuko.jpeg',
                      fit: BoxFit.cover,
                    ),
                    centerTitle: false,
                    collapseMode: CollapseMode.none,
                  ),
            pinned: true,
            floating: false,
            expandedHeight: kExpandedHeight,
            centerTitle: true,
            leading: Icon(Icons.menu_rounded),
          ),
          SliverList(
            delegate: SliverChildListDelegate(List<Text>.generate(100, (int i) {
              return Text("List item $i");
            })),
          ),
        ],
      ),
    );
  }
}
