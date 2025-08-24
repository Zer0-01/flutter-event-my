import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';

class LoginFormWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormFieldWidget(
            controller: widget.emailController,
            hintText: "Email Address",
          ),
          AppTextFormFieldWidget(
            controller: widget.passwordController,
            hintText: "Password",

            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _isObscure,
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
