import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smapur/shared/base.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController send = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseApp.puraBgApp(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: ListView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot \nPassword?",
                      style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                        "Don't worry, \nconfirm your registered \nemail, and you good to go!",
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
                    controller: send,
                    keyboardType: TextInputType.emailAddress,
                    scrollPhysics: const ClampingScrollPhysics(),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          "Registered Email",
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
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF43DAFB),
                            elevation: 5,
                            foregroundColor: Colors.black,
                            side: const BorderSide(
                                color: Colors.black, width: 0.8)),
                        child: Text(
                          "Send",
                          style: GoogleFonts.dmSans(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
