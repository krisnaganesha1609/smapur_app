import 'package:flutter/material.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/shared/const.dart';

class PasswordAndSecurity extends StatefulWidget {
  const PasswordAndSecurity({super.key});

  @override
  State<PasswordAndSecurity> createState() => _PasswordAndSecurityState();
}

class _PasswordAndSecurityState extends State<PasswordAndSecurity> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.puraBgApp(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.135,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          title: Text(
            "Password & Security!",
            style: ConstantsValue.primarySubheading,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                "Here contains all of your detailed and so-called sensitive data like phone number and email. You can only update this data by contacting the SMAPUR Admin. Otherwise, you can’t! So, keep in touch and let us know, aight!",
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login History",
                                style: ConstantsValue.primaryParagraph,
                              ),
                              Text(
                                "Check Your Login Activity",
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
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined)),
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
                                "Change Password",
                                style: ConstantsValue.primaryParagraph,
                              ),
                              Text(
                                "Feelin' something new?",
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
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
