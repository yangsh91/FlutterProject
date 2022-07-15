import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<PaymentTest> {
  late TextEditingController goods, customer, amt;
  var data = [];

  @override
  void initState() {
    goods = TextEditingController();
    customer = TextEditingController();
    amt = TextEditingController();
    super.initState();
  }

  void _processPayment() {
    print('....');

    String store_id = '1500000099';
    String crypto_key = '4A46D46E9AFA063763418CD22BAC813A';
    String store_name = '페이누리 테스트';
    String store_logo = 'https://demo.paynuri.com/images/logo_shop.png';
    String business_no = '1068621229';
    String tx_user_define = '페이누리^1048106004^페이누리^027270114';
    String tran_no = '12345678910';
    String product_type = '1';
    String tax_free_cd = '00';
    String goods_name = goods.text;
    String tot_amt = amt.text;
    String quantity = '1';
    String sale_date = '220307';
    String customer_name = customer.text;

    data = [
      {
        'STOREID': store_id,
        'CRYPTO_KEY': crypto_key,
        'STORE_NAME': store_name,
        'STORE_LOGO': store_logo,
        'BUSINESS_NO': business_no,
        'TRAN_NO': tran_no,
        'GOODS_NAME': goods_name,
        'AMT': tot_amt,
        'QUANTITY': quantity,
        'SALE_DATE': sale_date,
        'CUSTOMER_NAME': customer_name,
        'RETURN_URL': '/return',
        'COMPLETE_URL': '/complete',
        'CANCEL_URL': '/cancel',
        'TRAN_TYPE': 'CARD',
      }
    ];

    Get.toNamed('/payment', arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('페이누리 결제 테스트'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            child: Container(
              height: 40.0,
              child: TextField(
                controller: goods,
                decoration: const InputDecoration(
                  hintText: '상품명',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            child: Container(
              height: 40.0,
              child: TextField(
                controller: customer,
                decoration: const InputDecoration(
                  hintText: '고객명',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            child: Container(
              height: 40.0,
              child: TextField(
                controller: amt,
                decoration: const InputDecoration(
                  hintText: '금액을 입력하세요.',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            child: ElevatedButton(
              onPressed: () => _processPayment(),
              child: const Text(
                '결제하기',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
