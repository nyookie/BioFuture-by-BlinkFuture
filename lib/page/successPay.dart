import 'package:biofuture/page/SubscribeMeSenpai.dart';
import 'package:biofuture/page/profile_page.dart';
import 'package:flutter/material.dart';

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kShape = 30.0;
const kPrimaryColor = Color(0xFFFF8084);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;
const barRed = Color(0x3D0814);

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patreon +1 !"),
        backgroundColor: Colors.redAccent[200],
      ),
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: "lib/images/thankyou2.gif",
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Thank you for supporting us!',
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

class EmptySection extends StatelessWidget {
  final String emptyImg, emptyMsg;
  const EmptySection({
    Key? key,
    required this.emptyImg,
    required this.emptyMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(emptyImg),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: kLessPadding),
            child: Text(
              emptyMsg,
              style: kDarkTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

const kFixPadding = 16.0;
const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);

class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({
    Key? key,
    required this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kFixPadding),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: kSubTextStyle,
      ),
    );
  }
}
