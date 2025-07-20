import 'package:flutter/material.dart';
import 'package:iti_project/app_strings.dart';

import 'package:iti_project/app_colors.dart';
import 'package:iti_project/forget_password_row.dart';

class LoginScreenConente extends StatelessWidget {
  const LoginScreenConente({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.loginScreenWelcomeText),
        SizedBox(height: 50),
        TextField(
          decoration: InputDecoration(
            labelText: AppStrings.loginScreenWelcomeText,
            border: OutlineInputBorder(),
          ),
        ),

        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            fillColor: AppColors.whiteApp,
            filled: true,
            labelText: AppStrings.loginScreenPhonenumberTextFiled,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),

        ForgetPasswordRow(firstWhiteText: 'adfadfasdfa sdafadsf '),
        ElevatedButton(onPressed: () {}, child: Text('Login Button')),

        Padding(
          padding: EdgeInsets.only(top: 15),
          child: ForgetPasswordRow(
            firstWhiteText: 'إنشاء حساب ',
            secoednBlcakText: 'ليس لديك حساب ',
          ),
        ),
      ],
    );
  }
}
