import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/routes/app_pages.dart';

class Manage extends StatelessWidget {
  const Manage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('관리'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
      ),
      body: Center(
        child: Container(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.product_manage),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(22, 54, 105, 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        '상품관리',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      '고객관리',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
