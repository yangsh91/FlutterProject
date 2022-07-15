import 'package:flutter/material.dart';
import 'package:cartlist_app/detail.dart';
import 'package:cartlist_app/message.dart';
import 'package:cartlist_app/cart_list.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<CartList> todoList = [];

  @override
  void initState() {
    todoList
        .add(CartList(imagePath: 'assets/images/cart.png', workList: '책구매'));
    todoList.add(
        CartList(imagePath: 'assets/images/clock.png', workList: '철수와 약속'));
    todoList.add(
        CartList(imagePath: 'assets/images/pencil.png', workList: '스터디 준비하기'));
    super.initState();
  }

  void rebuildData() {
    setState(() {
      if (Message.actions == true) {
        todoList.add(
            CartList(imagePath: Message.imgPath, workList: Message.workList));
        Message.actions = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/add')
                .then((value) => rebuildData()),
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int item) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
            child: GestureDetector(
              onTap: () {
                Message.workList = todoList[item].workList;
                Message.imgPath = todoList[item].imagePath;
                Navigator.pushNamed(context, '/detail');
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => DetailList()));
              },
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        todoList[item].imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      child: Text(todoList[item].workList),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: todoList.length,
      ),
    );
  }
}
