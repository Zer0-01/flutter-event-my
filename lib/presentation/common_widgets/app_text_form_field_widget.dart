import 'package:flutter/material.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final bool readOnly;
  final String? hintText;
  final bool obscureText;

  const AppTextFormFieldWidget({
    super.key,
    this.controller,
    this.onTap,
    this.suffixIcon,
    this.readOnly = false,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        isCollapsed: true,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(),
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
