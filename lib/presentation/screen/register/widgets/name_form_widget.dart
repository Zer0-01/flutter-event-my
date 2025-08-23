import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';

class NameFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  const NameFormWidget({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          AppTextFormFieldWidget(
            controller: nameController,
            hintText: "John Doe",
          ),
        ],
      ),
    );
  }
}
