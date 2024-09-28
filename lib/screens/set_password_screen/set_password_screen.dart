import 'package:farm_2_home/screens/my_cart_screen/my_cart_screen.dart';
import 'package:flutter/material.dart';
import '../../components/assets_colors.dart';
import '../../components/assets_images.dart';
import '../../components/login_button.dart';
import '../../components/login_register_heading.dart';
import '../../components/vertical_spacing.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

String? password;
bool passwordOnClick = false;
TextEditingController setPasswordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SetPasswordState extends State<SetPassword> {
  final _setPasswordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
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
                  passwordTextFeild(context),
                  verticalSpacing(context),
                  passwordContent(),
                  verticalSpacing(context),
                  confirmPasswordTextFeild(context),
                  verticalSpacing(context),
                  LoginButton(
                      text: 'Login',
                      navigateTo: () {
                        if (_setPasswordKey.currentState!.validate() &&
                            _confirmPasswordKey.currentState!.validate()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const MyCartScreen();
                          })).then((value) {
                            setPasswordController.clear();
                            confirmPasswordController.clear();
                          });
                        }
                      }),
                  verticalSpacing(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordContent() {
    return Center(
      child: Text(
        'Your password must be between 8 and 30 characters. Must contain at least one uppercase, one lowercase and one digit.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AssetColors.secondaryTextColor,
          fontSize: 13.5,
        ),
      ),
    );
  }

  Widget passwordTextFeild(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Form(
        key: _setPasswordKey,
        child: TextFormField(
          controller: setPasswordController,
          obscuringCharacter: '*',
          obscureText: !passwordOnClick,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            hintText: 'Password',
            suffixIcon: passwordVisbilityIcon(),
          ),
          validator: (value) => (validateSetPassword(value!)),
        ),
      ),
    );
  }

  validateSetPassword(String text) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (text == '' || text.isEmpty) {
      return 'Please Enter the Password';
    } else if (!regex.hasMatch(text)) {
      return 'Enter valid password';
    }
    return null;
  }

  Widget passwordVisbilityIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          passwordOnClick = !passwordOnClick;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ImageIcon(
          AssetImage(Images.showPassword),
          color: (passwordOnClick)
              ? AssetColors.cartButtonColor
              : AssetColors.bottomBorderColor,
        ),
      ),
    );
  }

  Widget confirmPasswordTextFeild(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Form(
        key: _confirmPasswordKey,
        child: TextFormField(
          controller: confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          obscuringCharacter: '*',
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: 'Confirm Password',
          ),
          validator: (value) => validateConfirmPassword(value!),
        ),
      ),
    );
  }

  validateConfirmPassword(String text) {
    if (text == '' || text.isEmpty) {
      return 'Please Enter the Password';
    } else if (text != setPasswordController.text) {
      return 'Please Enter the correct Password';
    }
    return null;
  }
}
