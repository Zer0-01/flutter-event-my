import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/email_form_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/name_form_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/password_form_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/register_app_bar_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/register_button_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/register_title_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/terms_and_condition_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: RegisterAppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          RegisterTitleWidget(),
          NameFormWidget(),
          EmailFormWidget(),
          PasswordFormWidget(),
          TermsAndConditionWidget(),
          RegisterButtonWidget(),
        ],
      ),
    );
  }
}
