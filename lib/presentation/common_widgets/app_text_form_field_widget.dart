import 'package:flutter/material.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final bool readOnly;

  const AppTextFormFieldWidget({
    super.key,
    this.controller,
    this.onTap,
    this.suffixIcon,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        isCollapsed: true,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(),
        contentPadding: EdgeInsets.all(4),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
