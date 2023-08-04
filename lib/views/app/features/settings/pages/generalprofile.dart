import 'package:flutter/material.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/shared/const.dart';

class GeneralProfile extends StatefulWidget {
  const GeneralProfile({super.key});

  @override
  State<GeneralProfile> createState() => _GeneralProfileState();
}

class _GeneralProfileState extends State<GeneralProfile> {
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
          children: [
            Text(
              "Here you can check your fullname, username, and edit your profile photo. You can edit it by yourself or ask SMAPUR Admin to update your data!",
              style: ConstantsValue.primaryInlineText,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ConstantsValue.primaryBgColor,
                  border: Border.all(width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fullname",
                            style: ConstantsValue.primaryParagraph,
                          ),
                          Text(
                            "Mang Sed Alan Jayana",
                            style: ConstantsValue.primaryTransparentText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Flexible(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: ConstantsValue.primaryParagraph,
                          ),
                          Text(
                            "kangsedih123",
                            style: ConstantsValue.primaryTransparentText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Flexible(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile Photo",
                            style: ConstantsValue.primaryParagraph,
                          ),
                          Text(
                            "Check & Edit Your Photo",
                            style: ConstantsValue.primaryTransparentText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Flexible(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
