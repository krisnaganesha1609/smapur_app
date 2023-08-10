import 'package:flutter/material.dart';
import 'package:smapur/shared/const.dart';
import 'package:smapur/views/app/features/settings/widgets/editprofile.dart';

class UserStatus extends StatefulWidget {
  const UserStatus({super.key});

  @override
  State<UserStatus> createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> {
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
                        "Banjar Bandung Selatan",
                        style: ConstantsValue.primaryParagraph,
                      ),
                      Text(
                        "Tempek Sulaiman",
                        style: ConstantsValue.primaryParagraph,
                      ),
                      Text(
                        "Citizenship Status",
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
            const Divider(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                            text: "Admin" "\n",
                            style: ConstantsValue.primaryParagraph)
                      ])),
                      Text(
                        "Email",
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
      lastEdited: '17 Agustus tahun 45',
      pageName: 'Contact Info',
      save: () {},
    );
  }
}
