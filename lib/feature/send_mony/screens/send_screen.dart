import 'package:fast_block/core/utils/colors.dart';
import 'package:fast_block/core/widgets/custombutton.dart';
import 'package:fast_block/core/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _userController = TextEditingController();
    final _amountController = TextEditingController();
    final _noteController = TextEditingController();
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
                Container(
                  height: 100,
                  child: Image.asset(
                    "assets/bitcoin.png",
                  ),
                ),
                const Gap(20),
                Text(
                  "To",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textwhite,
                  ),
                ),
                const Gap(15),
                CustomTextFormField(
                  textStyle: const TextStyle(color: Colors.white),
                  controller: _userController,
                  labelText: "member",
                  hintText: "mohammed salah",
                  keyboardType: TextInputType.text,
                ),
                const Gap(15),
                Text(
                  "Amount",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textwhite),
                ),
                const Gap(15),
                CustomTextFormField(
                  textStyle: const TextStyle(color: Colors.white),
                  controller: _noteController,
                  labelText: "Amount",
                  hintText: "200",
                  keyboardType: TextInputType.number,
                ),
                Text(
                  "Note",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textwhite),
                ),
                const Gap(15),
                CustomTextFormField(
                  textStyle: const TextStyle(color: Colors.white),
                  controller: _amountController,
                  labelText: "member",
                  hintText: "**********",
                  keyboardType: TextInputType.text,
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      child: CustomTextButton(
                        text: "Send",
                        onPressed: () {},
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
