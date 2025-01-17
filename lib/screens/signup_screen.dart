import 'package:flutter/material.dart';
import 'package:projek_akhir/components/under_part.dart';
import 'package:projek_akhir/components/upside.dart';
import 'package:projek_akhir/components/page_title_bar.dart';
import 'package:projek_akhir/screens/login_screen.dart';
import 'package:projek_akhir/widgets/rounded_konfirm_password.dart';
import 'package:projek_akhir/widgets/widgets.dart';
import 'package:projek_akhir/main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                    imgUrl: "assets/images/bus-2.png", text: "Blue Buss Anjay"),
                const PageTitleBar(title: 'Create new account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Username",
                                icon: Icons.email,
                                controller: _emailController,
                              ),
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.person,
                                controller: _namaController,
                              ),
                              RoundedPasswordField(
                                controller: _passwordController,
                              ),
                              RoundedKonfirmPassword(
                                controller: _konfirmController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget switchListTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 40),
      child: SwitchListTile(
        dense: true,
        title: const Text(
          'Remember me',
          style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
        ),
        value: true,
        activeColor: kPrimaryColor,
        onChanged: (val) {},
      ),
    );
  }

  Widget iconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        RoundedIcon(
          imageUrl: "assets/images/facebook.png",
          url: 'https://www.facebook.com/login/',
        ),
        SizedBox(
          width: 20,
        ),
        RoundedIcon(
          imageUrl: "assets/images/twitter.png",
          url: 'https://twitter.com/i/flow/login',
        ),
        SizedBox(
          width: 20,
        ),
        RoundedIcon(
          imageUrl: "assets/images/google.jpg",
          url:
              'https://myaccount.google.com/?utm_source=sign_in_no_continue&pli=1',
        ),
      ],
    );
  }
}
