import 'package:flutter/material.dart';
import 'package:smapur/views/app/features/settings/widgets/editprofile.dart';

import 'package:smapur/shared/const.dart';

class Username extends StatefulWidget {
  const Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    return EditProfileWidgets(
      content: Container(
        decoration: BoxDecoration(
            color: ConstantsValue.primaryBgColor,
            border: Border.all(width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "kangsed123",
                        style: ConstantsValue.primaryParagraph,
                      ),
                      Text(
                        "Username",
                        style: ConstantsValue.primaryTransparentText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
      lastEdited: '17 Agustus taun 45',
      pageName: "Username",
      save: () {},
    );
  }
}
