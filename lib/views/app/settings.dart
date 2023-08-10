import "package:flutter/material.dart";
import "package:page_transition/page_transition.dart";
import "package:smapur/res/assets.dart";
import "package:smapur/shared/base.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:smapur/views/app/features/settings/mainprofile.dart";
import "package:smapur/views/auth/primary_auth.dart";

import "../../shared/const.dart";

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              "Your Settings!",
              style: ConstantsValue.primarySubheading,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.10,
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: ListView(
            children: [
              Text(
                "Profile",
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: ClipOval(
                      child: Image.asset(
                        ImageAssets.dummyProfile,
                        height: 50,
                        width: 50,
                      ),
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
                          "Mang Sed Alan Jayana",
                          style: ConstantsValue.primaryParagraph,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Citizen of Tempek Sulaiman",
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const MainProfile(),
                                  type: PageTransitionType.rightToLeft));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "General",
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.blue[300]),
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
                          "Additional Settings",
                          style: ConstantsValue.primaryParagraph,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.red),
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
                          "FAQ",
                          style: ConstantsValue.primaryParagraph,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ConstantsValue.yellowColor),
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
                          "Report Problems",
                          style: ConstantsValue.primaryParagraph,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.black),
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
                          "Log Out",
                          style: ConstantsValue.primaryParagraph,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const PrimaryAuth(),
                                  type: PageTransitionType.fade));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
