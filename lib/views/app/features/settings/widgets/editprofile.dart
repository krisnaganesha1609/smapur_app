import 'package:flutter/material.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/shared/const.dart';

class EditProfileWidgets extends StatelessWidget {
  final String pageName;
  final Widget content;
  final String lastEdited;
  final VoidCallback save;

  const EditProfileWidgets(
      {super.key,
      required this.pageName,
      required this.content,
      required this.lastEdited,
      required this.save});

  @override
  Widget build(BuildContext context) {
    return BaseApp.puraBgApp(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.135,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          elevation: 5,
          title: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              pageName,
              style: ConstantsValue.primarySubheading,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            content,
            Container(
              decoration: BoxDecoration(
                  color: ConstantsValue.primaryBgColor,
                  border: Border.all(width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Edited :",
                        style: ConstantsValue.primaryParagraph,
                      ),
                      Text(
                        lastEdited,
                        style: ConstantsValue.primaryTransparentText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            )
          ]),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: OutlinedButton(
              onPressed: save,
              style: OutlinedButton.styleFrom(
                  backgroundColor: ConstantsValue.primaryBtnColor,
                  elevation: 5,
                  side: const BorderSide()),
              child: Center(
                child: Text(
                  "Save Changes",
                  style: ConstantsValue.primaryInlineText,
                ),
              )),
        ));
  }
}
