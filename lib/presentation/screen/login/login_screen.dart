import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/login/widgets/login_app_bar_widget.dart';
import 'package:flutter_my_event/presentation/screen/login/widgets/login_button_widget.dart';
import 'package:flutter_my_event/presentation/screen/login/widgets/login_form_widget.dart';
import 'package:flutter_my_event/utils/image_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const LoginAppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Image.asset(ImageConstants.imageWeddingBackground),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Welcome!",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const LoginFormWidget(),
          const LoginButtonWidget(),
        ],
      ),
    );
  }
}
