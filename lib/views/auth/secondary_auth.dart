import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/views/auth/forgot_password.dart';
import 'package:smapur/views/nav/navbar.dart';

import '../../shared/const.dart';

class SecondaryAuth extends StatefulWidget {
  const SecondaryAuth({super.key});

  @override
  State<SecondaryAuth> createState() => _SecondaryAuthState();
}

class _SecondaryAuthState extends State<SecondaryAuth> {
  TextEditingController password = TextEditingController();
  bool visiblePassword = true;
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
                      "First Time \nLogin?",
                      style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text("Not that fast, \nplease provide \nyour password!",
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
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    scrollPhysics: const ClampingScrollPhysics(),
                    obscureText: visiblePassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visiblePassword = !visiblePassword;
                              });
                            },
                            icon: visiblePassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          "Password",
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
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const Navbar(),
                                  type: PageTransitionType.size,
                                  alignment: Alignment.bottomCenter));
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF43DAFB),
                            elevation: 5,
                            foregroundColor: Colors.black,
                            side: const BorderSide(
                                color: Colors.black, width: 0.8)),
                        child: Text(
                          "Validate",
                          style: GoogleFonts.dmSans(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: ConstantsValue.primaryInlineText,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const ForgotPassword(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          child:
                              Text("Click Here!", style: GoogleFonts.dmSans()))
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
