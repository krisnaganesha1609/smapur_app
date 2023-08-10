import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smapur/res/assets.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/shared/const.dart';
import 'package:smapur/views/app/features/settings/pages/detailedprofile.dart';
import 'package:smapur/views/app/features/settings/pages/generalprofile.dart';
import 'package:smapur/views/app/features/settings/pages/passwordandsecurity.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({super.key});

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.puraBgApp(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.135,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          title: Text(
            "Main Profile",
            style: ConstantsValue.primarySubheading,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              _buildMainProfile(
                  photo: ImageAssets.dummyProfile,
                  name: "Mang Sed Alan Jayana",
                  citizenship: "Tempek Sulaiman"),
              const SizedBox(
                height: 60,
              ),
              _buildMenuProfile(
                  color: Colors.green.shade300,
                  settingsName: "General Profile",
                  settingsDesc: "Fullname, Username, Profile Photo",
                  onIconBtnPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const GeneralProfile(),
                            type: PageTransitionType.rightToLeft));
                  }),
              const SizedBox(
                height: 20,
              ),
              _buildMenuProfile(
                  color: Colors.green.shade500,
                  settingsName: "Detailed Profile",
                  settingsDesc: "Date of Birth, Phone Number, Address",
                  onIconBtnPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const DetailedProfile(),
                            type: PageTransitionType.rightToLeft));
                  }),
              const SizedBox(
                height: 20,
              ),
              _buildMenuProfile(
                  color: Colors.green.shade800,
                  settingsName: "Password & Security",
                  settingsDesc: "Change Password, Last Login Attempt",
                  onIconBtnPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const PasswordAndSecurity(),
                            type: PageTransitionType.rightToLeft));
                  })
            ],
          ),
        ));
  }

  Widget _buildMainProfile(
          {required String photo,
          required String name,
          required String citizenship}) =>
      InkWell(
        splashColor: Colors.amber,
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              elevation: 50,
              child: ClipOval(
                child: Image.asset(
                  photo,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: ConstantsValue.primaryParagraph,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Citizen of $citizenship",
              style: ConstantsValue.primaryTransparentText,
            )
          ],
        ),
      );

  Widget _buildMenuProfile(
          {required Color color,
          required String settingsName,
          required String settingsDesc,
          required VoidCallback onIconBtnPressed}) =>
      Row(
        children: [
          ClipOval(
            child: Container(
              decoration: BoxDecoration(color: color),
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settingsName,
                  style: ConstantsValue.primaryParagraph,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  settingsDesc,
                  style: ConstantsValue.primaryTransparentText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          const Spacer(),
          Flexible(
            child: IconButton(
                onPressed: onIconBtnPressed,
                icon: const Icon(Icons.arrow_forward_ios_outlined)),
          ),
        ],
      );
}
