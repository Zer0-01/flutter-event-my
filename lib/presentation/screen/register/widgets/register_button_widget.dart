import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/register/bloc/register_bloc.dart';

class RegisterButtonWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterButtonWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16, right: 16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed:
                  _isButtonEnabled(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                        state.isAgree,
                      )
                      ? () {
                        context.read<RegisterBloc>().add(
                          OnRegisterEvent(
                            email: nameController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          ),
                        );
                      }
                      : null,
              child: const Text("Register"),
            ),
          ),
        );
      },
    );
  }

  bool _isButtonEnabled(
    String name,
    String email,
    String password,
    String confirmPassword,
    bool isAgree,
  ) {
    return name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        isAgree;
  }
}
