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
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          title: Text(
            pageName,
            style: ConstantsValue.primarySubheading,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: content,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: OutlinedButton(
                  onPressed: save,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: ConstantsValue.primaryBtnColor,
                      elevation: 5,
                      side: const BorderSide()),
                  child: Text(
                    "Save Changes",
                    style: ConstantsValue.primaryInlineText,
                  )),
            ),
          ],
        ));
  }
}
