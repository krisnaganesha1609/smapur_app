import 'package:flutter/material.dart';
import 'package:smapur/shared/const.dart';
import 'package:smapur/views/app/features/settings/widgets/editprofile.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
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
                        "(+62) 878 9098 7654",
                        style: ConstantsValue.primaryParagraph,
                      ),
                      Text(
                        "Phone Number",
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
                      Text(
                        "mangsedeuy@somemail.com",
                        style: ConstantsValue.primaryParagraph,
                      ),
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
