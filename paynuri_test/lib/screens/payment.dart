import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String store_id = '1500000099';
    String crypto_key = '4A46D46E9AFA063763418CD22BAC813A';
    String store_name = '페이누리 테스트';
    String store_logo =
        'https://w7.pngwing.com/pngs/1009/407/png-transparent-swoosh-nike-just-do-it-logo-nike-angle-logo-adidas.png';
    String business_no = '1068621229';
    String tx_user_define = '페이누리^1048106004^페이누리^027270114';
    String tran_no = '20220527ASXF';
    String product_type = '1';
    String tax_free_cd = '00';
    String goods_name = '테스트 상품';
    String tot_amt = '1004';
    String quantity = '1';
    String sale_date = '220527';
    String customer_name = '테스터';

    var data = {
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
    };

    String url = "";

    if (Platform.isIOS) {
      url = "https://pg.paynuri.com/paymentgateway/mobile/reqPay.do";
    } else {
      url = "https://pg.paynuri.com/paymentgateway/mobile/reqPay.do";
    }

    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://pg.paynuri.com/paymentgateway/mobile/reqPay.do"),
            method: 'POST',
            body: Uint8List.fromList(utf8.encode(
                "STOREID=$store_id&CRYPTO_KEY=$crypto_key&STORE_NAME=$store_name&STORE_LOGO=$store_logo&BUSINESS_NO=$business_no&TRAN_NO=$tran_no&GOODS_NAME=$goods_name&AMT=$tot_amt&QUANTITY=$quantity&SALE_DATE=$sale_date&CUSTOMER_NAME=$customer_name&RETURN_URL=/result&COMPLETE_URL=/complete&CANCEL_URL=/cancel&TRAN_TYPE=CARD")),
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded;charset=euc-kr'
            },
          ),
          onWebViewCreated: (controller) {},
        ),
      ),
    );
  }
}
