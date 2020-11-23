import 'dart:io';

import 'package:dimofinf/providers/auth.dart';
import 'package:dimofinf/widgets/big_button.dart';
import 'package:dimofinf/widgets/login_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  String _password;

  String _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool secure = true;

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<Auth>(context,listen: false);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/back.png"),
                  fit: BoxFit.cover),

              color: Colors.black,

//                borderRadius: BorderRadius.all( Radius.circular(40)),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 0, top: 30),
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Text(
                  "Food Delivery App",
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 35),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 800,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60)),
                    color: Colors.white,
                  ),
                  child: FormBuilder(
                    key: fbKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 50),
                          child: Text(
                            "Login",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        LoginCard(
                          obscure: false,
                          textInputType: TextInputType.emailAddress,
                          name: "Email",
                          valid: [
                            FormBuilderValidators.email(
                                errorText:
                                    "This field requiers a vaild email address"),
//                              FormBuilderValidators.pattern("/^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})i",),
                          ],
                          save: (value) {
                            _email = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginCard(
                          obscure: secure,
                          textInputType: TextInputType.visiblePassword,
                          name: "Password",
                          valid: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ],
                          save: (value) {
                            _password = value;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BigButton(
                            name: "Login",
                            color: Colors.black,
                            onTap: () {
                              if (fbKey.currentState.validate()) {
                                fbKey.currentState.save();

                               login.signInWithEmailAndPassword(_email, _password, context);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: RichText(
                              text: TextSpan(
                            text: "Don't have any account? Sign Up",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
