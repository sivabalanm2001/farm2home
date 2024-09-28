import 'package:farm_2_home/components/login_check_box.dart';
import 'package:farm_2_home/screens/login_screen/login_screen.dart';
import 'package:farm_2_home/screens/otp_verfication_screen/otp_verfication_screen.dart';
import 'package:flutter/material.dart';
import '../../components/assets_colors.dart';
import '../../components/login_button.dart';
import '../../components/login_register_heading.dart';
import '../../components/vertical_spacing.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool termsAndCondtion = false;
bool privacyPolicy = false;
TextEditingController registeEmailController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AssetColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  verticalSpacing(context),
                  loginRegisterHeading(context),
                  registerTextFormFeild(context),
                  verticalSpacing(context),
                  verticalSpacing(context),
                  loginText('We will send a code to validate.',
                      AssetColors.secondaryTextColor),
                  verticalSpacing(context),
                  verticalSpacing(context),
                  termsAndPrivacy(),
                  verticalSpacing(context),
                  verticalSpacing(context),
                  LoginButton(
                    text: 'Proceed',
                    navigateTo: () {
                      if (_registerKey.currentState!.validate()) {
                        if (privacyPolicy && termsAndCondtion) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const OtpVerification();
                          })).then((value) {
                            registeEmailController.clear();
                            termsAndCondtion = false;
                            privacyPolicy = false;
                          });
                        } else {
                          const snackBar = SnackBar(
                            content: Text(
                                'Check Terms and Conditions  & privacy policy'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  ),
                  verticalSpacing(context),
                  existingUser(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget existingUser(BuildContext context) {
    return Row(
      children: [
        loginText('Existing User?', AssetColors.primaryTextColor),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: loginText(
            'Login Here',
            AssetColors.cartButtonColor,
          ),
        ),
      ],
    );
  }

  Widget termsAndPrivacy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginCheckBox(
          text: 'Terms and Conditions',
          onClick: termsAndCondtion,
          onChanged: () {
            setState(() {
              termsAndCondtion = !termsAndCondtion;
            });
          },
        ),
        LoginCheckBox(
            text: 'Privacy Policy',
            onClick: privacyPolicy,
            onChanged: () {
              setState(() {
                privacyPolicy = !privacyPolicy;
              });
            })
      ],
    );
  }

  Widget loginText(text, textColor) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 15.0,
      ),
    );
  }

  Widget registerTextFormFeild(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Form(
        key: _registerKey,
        child: TextFormField(
          controller: registeEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: 'Register using your Email ID',
          ),
          validator: (value) => (validateRegisterId(value!)),
        ),
      ),
    );
  }

  validateRegisterId(String text) {
    if (text == '' || text.isEmpty) {
      return 'Please Enter the Email ID';
    }
    return null;
  }
}
