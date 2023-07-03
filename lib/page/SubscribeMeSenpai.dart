import 'package:biofuture/page/profile_page.dart';
import 'package:biofuture/page/successPay.dart';
import 'package:flutter/material.dart';

final paymentLabels = [
  'Credit card',
  'Touch n Go',
  'Online Banking',
  'Boost',
];

final paymentIcons = [
  Icons.credit_card,
  Icons.money_off,
  Icons.payment,
  Icons.account_balance_wallet,
];

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;
  int i = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage()),
                (route) => false);
          },
        ),
        backgroundColor: Colors.red[200],
        title: Text('Patreon', style: TextStyle(color: kDarkColor)),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(child: Text(' ')),
            Expanded(
                flex: 3,
                child: Text('If you like our Apps, tips me SENPAI!',
                    style: TextStyle(
                      backgroundColor: kWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ))),
            Expanded(
              flex: 2,
              child: Image.asset("lib/images/thankyou.gif"),
            )
          ]),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kDarkColor,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = 1),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: kDarkColor),
                  ),
                  trailing: Icon(paymentIcons[index], color: kDarkColor),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          DefaultButton(
            btnText: 'Pay',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Success(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kShape = 30.0;
const kPrimaryColor = Color(0xFFFF8084);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

class DefaultButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const DefaultButton({
    Key? key,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: kLessPadding),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(kShape)),
        color: kPrimaryColor,
        textColor: kWhiteColor,
        highlightColor: kTransparent,
        onPressed: onPressed,
        child: Text(btnText.toUpperCase()),
      ),
    );
  }
}
