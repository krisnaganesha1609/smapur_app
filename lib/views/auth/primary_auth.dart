import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/views/auth/secondary_auth.dart';

class PrimaryAuth extends StatefulWidget {
  const PrimaryAuth({super.key});

  @override
  State<PrimaryAuth> createState() => _PrimaryAuthState();
}

class _PrimaryAuthState extends State<PrimaryAuth> {
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BaseApp.puraBgApp(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: ListView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Om \nSwastyastu",
                        style: GoogleFonts.dmSans(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text("Please Identify \nYourself First!",
                          style: GoogleFonts.dmSans(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: username,
                      keyboardType: TextInputType.text,
                      scrollPhysics: const ClampingScrollPhysics(),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          label: Text(
                            "Username",
                            style: GoogleFonts.dmSans(),
                          )),
                      style:
                          GoogleFonts.dmSans(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const SecondaryAuth(),
                                ));
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF43DAFB),
                              elevation: 5,
                              foregroundColor: Colors.black,
                              side: const BorderSide(
                                  color: Colors.black, width: 0.8)),
                          child: Text(
                            "Let Me In!",
                            style: GoogleFonts.dmSans(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
