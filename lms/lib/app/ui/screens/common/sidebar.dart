import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lms/app/routes/app_pages.dart';

class SideBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _customTileExpanded = false;
  SharedPreferences? logindata;
  String? no;
  String? user_id;

  @override
  void initState() {
    initial();

    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      no = logindata!.getString('no');
      user_id = logindata!.getString('user_id');
    });
  }

  void userLogout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 85.0,
          child: DrawerHeader(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.INFO);
              },
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        //padding: EdgeInsets.only(top: 30.0),
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 45,
                          width: 45,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/sohee.jpeg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '$user_id',
                                    style: TextStyle(fontSize: 22.0),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('??????'))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            ExpansionTile(
              title: Text('??????'),
              trailing: Icon(Icons.arrow_drop_down),
              children: [
                ListTile(
                  title: Text('?????????'),
                  onTap: () {
                    setState(() {});
                  },
                ),
                ListTile(
                  title: Text('????????????'),
                  onTap: () {
                    Get.toNamed(Routes.NOTICE_LIST);
                  },
                ),
                // ListTile(
                //   title: Text('refresh'),
                //   onTap: () {
                //     setState(() {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Refresh()));
                //     });
                //   },
                // ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
            ListTile(
              title: Text('????????????'),
              onTap: () {
                Get.toNamed(Routes.ATD_LIST);
              },
            ),
            ExpansionTile(
              title: Text('????????????'),
              trailing: Icon(Icons.arrow_drop_down),
              children: [
                ListTile(
                  title: Text('???????????????'),
                  onTap: () {
                    Get.toNamed(Routes.STUDY);
                  },
                ),
                ListTile(
                  title: Text('????????????'),
                  onTap: () {
                    setState(() {});
                  },
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
            ExpansionTile(
              title: Text('???????????????'),
              trailing: Icon(Icons.arrow_drop_down),
              children: [
                ListTile(
                  title: Text('?????????'),
                  onTap: () {
                    setState(() {});
                  },
                ),
                ListTile(
                  title: Text('????????????'),
                  onTap: () {
                    setState(() {});
                  },
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
            ListTile(
              title: Text('????????????'),
              onTap: () {
                setState(() {
                  userLogout();

                  Get.toNamed(Routes.LOGIN);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
