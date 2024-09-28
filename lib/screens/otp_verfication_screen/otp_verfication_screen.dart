import 'package:farm_2_home/screens/set_password_screen/set_password_screen.dart';
import 'package:flutter/material.dart';

import '../../components/assets_colors.dart';
import '../../components/login_button.dart';
import '../../components/login_register_heading.dart';
import '../../components/vertical_spacing.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

TextEditingController otpTextFeildController1 = TextEditingController();
TextEditingController otpTextFeildController2 = TextEditingController();
TextEditingController otpTextFeildController3 = TextEditingController();
TextEditingController otpTextFeildController4 = TextEditingController();

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AssetColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  verticalSpacing(context),
                  loginRegisterHeading(context),
                  verticalSpacing(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      otpTextFeild(context, otpTextFeildController1),
                      const SizedBox(width: 15.0),
                      otpTextFeild(context, otpTextFeildController2),
                      const SizedBox(width: 15.0),
                      otpTextFeild(context, otpTextFeildController3),
                      const SizedBox(width: 15.0),
                      otpTextFeild(context, otpTextFeildController4),
                    ],
                  ),
                  verticalSpacing(context),
                  verticalSpacing(context),
                  otpDescription(context),
                  verticalSpacing(context),
                  verticalSpacing(context),
                  verticalSpacing(context),
                  LoginButton(
                      text: 'Proceed',
                      navigateTo: () {
                        if (otpTextFeildController1.text.isNotEmpty &&
                            otpTextFeildController2.text.isNotEmpty &&
                            otpTextFeildController3.text.isNotEmpty &&
                            otpTextFeildController4.text.isNotEmpty) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SetPassword();
                          }));
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Please Enter the Otp'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }),
                  verticalSpacing(context),
                  resendButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget resendButton() {
    return Row(
      children: [
        Text(
          'Code not received?',
          style: TextStyle(
            color: AssetColors.primaryTextColor,
            fontSize: 15.0,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Resend',
            style: TextStyle(
              color: AssetColors.cartButtonColor,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget otpDescription(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.68,
      child: Text(
        'Enter validation code send to your email. Code will expire in 5 mins.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AssetColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget otpTextFeild(BuildContext context, controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.14,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        maxLength: 1,
        controller: controller,
        cursorColor: AssetColors.cartButtonColor,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AssetColors.cartButtonColor,
              width: 3.0,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AssetColors.cartButtonColor,
              width: 3.0,
            ),
          ),
        ),
        style: TextStyle(color: AssetColors.cartButtonColor),
      ),
    );
  }
}
