import 'package:fast_block/core/navigation/app_router.dart';
import 'package:fast_block/core/utils/colors.dart';
import 'package:fast_block/core/widgets/custombutton.dart';
import 'package:fast_block/core/widgets/customtextformfield.dart';
import 'package:fast_block/feature/Home/Main_Layout/home_screen.dart';
import 'package:fast_block/feature/auth/presentaion/page/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Gap(35),
                  Container(
                    height: 100,
                    child: Image.asset(
                      "assets/bitcoin.png",
                    ),
                  ),
                  const Gap(20),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textwhite),
                  ),
                  const Gap(20),
                  Text(
                    "Send money internationally with ease",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textwhite),
                  ),
                  const Gap(50),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: "Login",
                          onPressed: () {
                            NavigationHelper.push(context, const LoginScreen());
                          },
                          backgroundColor: AppColors.container,
                          textColor: (Colors.white),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomTextButton(
                          text: "Register",
                          onPressed: () {
                            NavigationHelper.push(
                                context, const RegisterScreen());
                          },
                          backgroundColor: AppColors.container,
                          textColor: (Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Gap(50),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    labelText: "E_mail",
                    hintText: "**********@gmail.com",
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      color: Colors.white,
                    ),
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  const Gap(15),
                  CustomTextFormField(
                    obscureText: true,
                    textStyle: const TextStyle(color: Colors.white),
                    labelText: "password",
                    controller: _passwordController,
                    hintText: "***********",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.white,
                        )),
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: "Login",
                          //navigate and replace
                          onPressed: () {
                            NavigationHelper.push(context, Homescreen());
                          },
                          backgroundColor: AppColors.container,
                          textColor: (Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Remember Me",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const Gap(80),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              // NavigationHelper.push(
                              //     context, Forgetpasswordscreen());
                            },
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
