import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTextFormFieldWidget(hintText: "Email Address"),
          const AppTextFormFieldWidget(
            hintText: "Password",
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.visibility),
            ),
          ),
          Text(
            "Forgot Password",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
