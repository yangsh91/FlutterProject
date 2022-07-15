import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class PaymentTest extends StatefulWidget {
  const PaymentTest({Key? key}) : super(key: key);

  @override
  _PaymentTestState createState() => _PaymentTestState();
}

class _PaymentTestState extends State<PaymentTest> {
  late TextEditingController num1,
      num2,
      num3,
      num4,
      exp1,
      exp2,
      cardNum,
      cardExp;
  String cardMonthly = '00';
  CardSystemData? _cardSystemData;

  @override
  void initState() {
    super.initState();

    num1 = TextEditingController();
    num2 = TextEditingController();
    num3 = TextEditingController();
    num4 = TextEditingController();

    exp1 = TextEditingController();
    exp2 = TextEditingController();

    cardNum = TextEditingController();
    cardExp = TextEditingController();
  }

  void inputChange(String type, String num) {
    if (type == 'card') {
      final cardNum = num.split(' ');

      num1.text = cardNum[0];
      if (cardNum.length == 2) {
        num2.text = cardNum[1];
      }

      if (cardNum.length == 3) {
        num3.text = cardNum[2];
      }

      if (cardNum.length == 4) {
        num4.text = cardNum[3];
      }
    } else if (type == 'exp') {
      final expNum = num.split('/');

      exp1.text = expNum[0];
      if (expNum.length == 2) {
        exp2.text = expNum[1];
      }
    }
  }

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

  void _doActPayment() async {
    var card = cardNum.text;

    card = card.replaceAll(' ', '');
    if (card.length != 16) {
      _showDialog('카드번호를 확인하세요.');
      return;
    }

    final card_exp = cardExp.text.split('/');

    var exp = '20' + card_exp[1] + card_exp[0];

    var monthly = cardMonthly;

    var data = {
      'type': 'pay',
      'mode': 'payment',
      'STOREID': '1500000099',
      'CRYPTO_KEY': '4A46D46E9AFA063763418CD22BAC813A',
      'GOODS_NAME': '테스트수기결제상품',
      'PRODUCT_TYPE': '2',
      'TRAN_TYPE': 'MNUL',
      'KIND': '0200',
      'TAX_FREE_CD': '00',
      'TAX_AMT': '',
      'BILL_TYPE': '18',
      'AMT': '1004',
      'QUANTITY': '1',
      'CUSTOMER_NAME': '오라인포',
      'CARD_NO': card,
      'EXPIRATION_DATE': exp,
      'INSTALL': cardMonthly,
      'ENC_DATA': '',
    };

    print("!!!!!");

    var response = await http.post(
      Uri.parse('http://inlive.holaedu.net/payment/online/pgCreditPayment'),
      headers: {"Accept": "application/json"},
      body: data,
    );

    print('=== $response ===');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      print(jsonResponse);
    }
  }

  void _showDialog(String text) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('경고'),
            content: Text(text),
            actions: [
              CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  isDefaultAction: true,
                  child: Text('확인')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('수기결제 테스트'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                ),
                                Text(
                                  '페이누리 카드 수기결제',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          child: Container(
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 30.0,
                                  child: TextField(
                                    controller: num1,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 30.0,
                                  child: TextField(
                                    controller: num2,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 30.0,
                                  child: TextField(
                                    controller: num3,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 30.0,
                                  child: TextField(
                                    controller: num4,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          child: Container(
                            height: 50.0,
                            child: Row(
                              children: [
                                const Text(
                                  'Exp.',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 30.0,
                                  child: TextField(
                                    controller: exp1,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Text(
                                    '/',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 30.0,
                                  child: TextField(
                                    controller: exp2,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('카드번호'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 5.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: cardNum,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '#### #### #### ####',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(.3),
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      CreditCardNumberInputFormatter(
                        onCardSystemSelected: (CardSystemData? cardSystemData) {
                          setState(() {
                            _cardSystemData = cardSystemData;
                          });
                        },
                      ),
                    ],
                    onChanged: (cardNum) => inputChange('card', cardNum),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('유효기간'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 5.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: cardExp,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '00/00',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(.3),
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      CreditCardExpirationDateFormatter(),
                    ],
                    onChanged: (cardNum) => inputChange('exp', cardNum),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('할부개월'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 5.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.centerLeft,
                  child: DropdownButton<String>(
                    isDense: true,
                    isExpanded: true,
                    elevation: 33,
                    value: cardMonthly,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    dropdownColor: Colors.white,
                    itemHeight: null,
                    items: const [
                      DropdownMenuItem(child: Text('일시불'), value: '00'),
                      DropdownMenuItem(child: Text('2개월'), value: '02'),
                      DropdownMenuItem(child: Text('3개월'), value: '03'),
                      DropdownMenuItem(child: Text('4개월'), value: '04'),
                      DropdownMenuItem(child: Text('5개월'), value: '05'),
                      DropdownMenuItem(child: Text('6개월'), value: '06'),
                      DropdownMenuItem(child: Text('7개월'), value: '07'),
                      DropdownMenuItem(child: Text('8개월'), value: '08'),
                      DropdownMenuItem(child: Text('9개월'), value: '09'),
                      DropdownMenuItem(child: Text('10개월'), value: '10'),
                      DropdownMenuItem(child: Text('11개월'), value: '11'),
                      DropdownMenuItem(child: Text('12개월'), value: '12'),
                    ],
                    onChanged: (value) {
                      setState(() {
                        cardMonthly = value.toString();
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: GestureDetector(
                  onTap: () => _doActPayment(),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: Text(
                        '결제하기',
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
