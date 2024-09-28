import 'package:farm_2_home/screens/products_category_screen/dairy_product_page.dart';
import 'package:farm_2_home/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import '../../components/assets_colors.dart';
import '../../components/assets_images.dart';
import '../../components/login_check_box.dart';
import '../../components/login_button.dart';
import '../../components/login_register_heading.dart';
import '../../components/vertical_spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool keepSigned = false;
bool passwordOnClick = false;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  final _loginEmailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
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
                  emailTextFormFeild(context),
                  verticalSpacing(context),
                  passwordTextFormFeild(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  forgotPassword(),
                  verticalSpacing(context),
                  verticalSpacing(context),
                  LoginButton(
                      text: 'Login',
                      navigateTo: () {
                        if (_loginEmailKey.currentState!.validate() &&
                            _passwordKey.currentState!.validate()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ProductCategoriesPage();
                          })).then((value) {
                            emailController.clear();
                            passwordController.clear();
                          });
                        }
                      }),
                  verticalSpacing(context),
                  registerButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailTextFormFeild(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Form(
        key: _loginEmailKey,
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email ID',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          validator: (value) => (validateEmail(value!)),
        ),
      ),
    );
  }

  validateEmail(String text) {
    if (text == '' || text.isEmpty) {
      return 'Please Enter the Email';
    }
    return null;
  }

  Widget passwordTextFormFeild(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Form(
        key: _passwordKey,
        child: TextFormField(
          controller: passwordController,
          obscuringCharacter: '*',
          obscureText: !passwordOnClick,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            suffixIcon: passwordVisbilityIcon(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: 'Password',
          ),
          validator: (value) => (validatePassword(value!)),
        ),
      ),
    );
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

  validatePassword(String text) {
    if (text == '' || text.isEmpty) {
      return 'Please Enter the Password';
    }
    return null;
  }

  Widget forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginCheckBox(
          text: 'Keep me Signed In',
          onClick: keepSigned,
          onChanged: () {
            setState(() {
              keepSigned = !keepSigned;
            });
          },
        ),
        Text(
          'Forgot Password?',
          style: TextStyle(
            color: AssetColors.primaryTextColor,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  Widget registerButton(BuildContext context) {
    return Row(
      children: [
        Text(
          'New User?',
          style: TextStyle(
            color: AssetColors.primaryTextColor,
            fontSize: 15.0,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: Text(
            'Register Here',
            style: TextStyle(
              color: AssetColors.cartButtonColor,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
