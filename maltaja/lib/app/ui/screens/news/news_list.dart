import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/news/news_controller.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class NewsList extends GetView<NewsController> {
  @override
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '소식',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.newsList.length,
        itemBuilder: (_, index) {
          if (index < controller.newsList.length) {
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.NEWS_DETAIL),
              child: Container(
                height: 65.0,
                color: Colors.grey.shade50,
                margin: EdgeInsets.only(top: 1.0, bottom: 1.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 55.0,
                      height: 55.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/goldship.png',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10.0, left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: Container(
                              child:
                                  Text(controller.newsList[index]['subject']),
                            )),
                            Expanded(
                                child: Container(
                              child: Text(controller.newsList[index]['date']
                                  .toString()),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Container(
            child: Center(
              child: Text('마지막 글 입니다.'),
            ),
          );
        },
        //separatorBuilder: (_, index) => Divider(),
      ),
    );
  }
}
