import 'package:flutter/material.dart';
import 'package:smapur/shared/const.dart';
import 'package:smapur/views/app/features/settings/widgets/editprofile.dart';

class Fullname extends StatefulWidget {
  const Fullname({super.key});

  @override
  State<Fullname> createState() => _FullnameState();
}

class _FullnameState extends State<Fullname> {
  @override
  Widget build(BuildContext context) {
    return EditProfileWidgets(
      pageName: "Fullname",
      content: Container(
        decoration: BoxDecoration(
            color: ConstantsValue.primaryBgColor,
            border: Border.all(width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          "Mang",
                          style: ConstantsValue.primaryParagraph,
                        ),
                        Text(
                          "First Name",
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
                          "Sed Alan",
                          style: ConstantsValue.primaryParagraph,
                        ),
                        Text(
                          "Middle Name",
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
                          "Jayana",
                          style: ConstantsValue.primaryParagraph,
                        ),
                        Text(
                          "Last Name",
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
      ),
      lastEdited: '17 Agustus taun 45',
      save: () {},
    );
  }
}
