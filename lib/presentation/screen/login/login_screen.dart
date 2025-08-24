import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/login/widgets/login_app_bar_widget.dart';
import 'package:flutter_my_event/presentation/screen/login/widgets/login_button_widget.dart';
import 'package:flutter_my_event/presentation/screen/login/widgets/login_form_widget.dart';
import 'package:flutter_my_event/utils/extensions.dart';
import 'package:flutter_my_event/utils/image_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.addListener(_onChanged);
    _passwordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onChanged() {
    setState(() {});
  }

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
              "${context.l10n.welcome}!",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          LoginFormWidget(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          LoginButtonWidget(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ],
      ),
    );
  }
}
