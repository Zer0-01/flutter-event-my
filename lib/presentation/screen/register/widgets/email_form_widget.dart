import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_my_event/utils/validators.dart';

class EmailFormWidget extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFormWidget({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          AppTextFormFieldWidget(
            controller: emailController,
            hintText: "john@email.com",
            validator: (value) {
              return Validators.email(value);
            },
          ),
        ],
      ),
    );
  }
}
