import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/email_form_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/name_form_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/password_form_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/register_app_bar_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/register_button_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/register_title_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/widgets/terms_and_condition_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameController.addListener(_onChanged);
    _emailController.addListener(_onChanged);
    _passwordController.addListener(_onChanged);
    _confirmPasswordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBarWidget(),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            const RegisterTitleWidget(),
            NameFormWidget(nameController: _nameController),
            EmailFormWidget(emailController: _emailController),
            PasswordFormWidget(
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
            ),
            const TermsAndConditionWidget(),
            RegisterButtonWidget(
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
