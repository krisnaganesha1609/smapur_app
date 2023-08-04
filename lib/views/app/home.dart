import 'package:flutter/material.dart';
import 'package:smapur/res/assets.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/shared/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smapur/views/app/features/citizendatacard/citizendatacard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int codes = 1;
  @override
  void initState() {
    super.initState();
    getHomeStatus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getHomeStatus();
  }

  Future<int?> getHomeStatus() async {
    int? isPass;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isPass = prefs.getInt("feedback");
    return isPass;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BaseApp.puraBgApp(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.135,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 5,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to",
                      style: ConstantsValue.primaryInlineText,
                    ),
                    Text(
                      "SMAPUR!",
                      style: ConstantsValue.primarySubheading,
                    )
                  ]),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ClipOval(
                        child: Image.asset(
                          ImageAssets.dummyProfile,
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Text(
                      "Mang Sed",
                      style: ConstantsValue.primaryInlineText,
                    )
                  ],
                ),
              ),
            ],
          ),
          // ignore: unrelated_type_equality_checks
          body: getHomeStatus() == codes
              ? _sendFeedbackWidget()
              : ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  children: const [CitizenDataCard()])),
    );
  }

  _sendFeedbackWidget() {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        children: [
          Text(
            "Right Now, SMAPUR Are Still Just A Raw Apps Without Essential Features. You Can Give Us Your Feedback On What’s Need To Be Added In Order To Improving The Apps For Future Cause. Just Standby For Next Update, Okay?",
            style: ConstantsValue.primaryParagraph,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ConstantsValue.lightGreenBtnColor,
                    elevation: 5),
                child: Text(
                  "Send Feedback",
                  style: ConstantsValue.primaryParagraph,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setInt("feedback", codes);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade100, elevation: 5),
                child: Text(
                  "Skip",
                  style: ConstantsValue.primaryParagraph,
                )),
          ),
        ]);
  }
}
