import 'package:fast_block/core/navigation/app_router.dart';
import 'package:fast_block/core/utils/colors.dart';
import 'package:fast_block/core/widgets/custombutton.dart';
import 'package:fast_block/core/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  String? _selectedGender; // Variable to store the selected gender
  final List<String> _genders = ['Male', 'Female']; // Gender options

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                  const Gap(50),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: "Login",
                          onPressed: () {
                            NavigationHelper.goBack(context);
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
                    keyboardType: TextInputType.number,
                    controller: _nameController,
                    prefixIcon: Icon(
                      Icons.person_pin_rounded,
                      color: AppColors.textwhite,
                    ),
                    labelText: "National ID",
                    hintText: "*************",
                    // prefixIcon: Icon(
                    //   Icons.near_me,
                    //   color: AppColors.textwhite,
                    // ),
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  const Gap(15),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    labelText: "E_mail",
                    controller: _emailController,
                    hintText: "**********@***",
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: AppColors.textwhite,
                    ),
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  //00000000

                  const Gap(20),
                  CustomTextFormField(
                    textStyle: const TextStyle(color: Colors.white),
                    labelText: "Phone",
                    keyboardType: TextInputType.phone,
                    hintText: "002*******",
                    controller: _phoneController,
                    //    prefixIcon:  Icon(Icons.lock,color: AppColors.textwhite,),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.phone_outlined,
                          color: Colors.white,
                        )),
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    textStyle: const TextStyle(color: Colors.white),
                    labelText: "password",
                    obscureText: true,
                    hintText: "***********",
                    controller: _passwordController,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.textwhite,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye_rounded)),
                  ),
                  const Gap(15),
                  CustomTextFormField(
                    obscureText: true,
                    textStyle: const TextStyle(color: Colors.white),
                    labelText: "Confirm Password",
                    hintText: "***********",
                    controller: _confirmpasswordController,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.textwhite,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye_rounded)),
                  ),
                  Row(
                    children: [
                      Text('Choose your gender:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textwhite)),
                      const Gap(20),
                      DropdownButton<String>(
                        value: _selectedGender,
                        hint: const Text('Select Gender'),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value; // Update selected gender
                          });
                        },
                        items: _genders.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(
                              gender,
                              selectionColor: AppColors.textwhite,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20), // Spacer
                  // Display selected gender
                  if (_selectedGender != null)
                    Text(
                      'Selected Gender: $_selectedGender',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: "Register",
                          onPressed: () {
                            if (_confirmpasswordController.text ==
                                _passwordController.text) {
                              // NavigationHelper.navigateAndReplace(
                              //     context, LoginScreen());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Passwords do not match')),
                              );
                            }
                          },
                          backgroundColor: AppColors.container,
                          textColor: (Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
