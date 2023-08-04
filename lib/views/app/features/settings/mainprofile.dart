import 'package:flutter/material.dart';
import 'package:smapur/res/assets.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/shared/const.dart';

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
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          elevation: 5,
          title: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              "Your Settings!",
              style: ConstantsValue.primarySubheading,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            _buildMainProfile(
                photo: ImageAssets.dummyProfile,
                name: "Mang Sed Alan Jayana",
                citizenship: "Tempek Sulaiman"),
            const SizedBox(
              height: 20,
            ),
            _buildMenuProfile(
                color: Colors.green.shade400,
                settingsName: "General Profile",
                settingsDesc: "Fullname, Username, Profile Photo",
                onIconBtnPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            _buildMenuProfile(
                color: Colors.green.shade600,
                settingsName: "Detailed Profile",
                settingsDesc: "Date of Birth, Phone Number, Address",
                onIconBtnPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            _buildMenuProfile(
                color: Colors.green.shade800,
                settingsName: "Password & Security",
                settingsDesc: "Change Password, Last Login Attempt",
                onIconBtnPressed: () {})
          ],
        ));
  }

  Widget _buildMainProfile(
          {required String photo,
          required String name,
          required String citizenship}) =>
      InkWell(
        onTap: () {},
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              elevation: 10,
              child: ClipOval(
                child: Image.asset(
                  photo,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: ConstantsValue.primaryParagraph,
            ),
            const SizedBox(
              height: 5,
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
