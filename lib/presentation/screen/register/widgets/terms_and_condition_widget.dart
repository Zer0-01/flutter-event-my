import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Checkbox.adaptive(value: false, onChanged: (value) {}),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(text: "I've read and agree with the "),
                  TextSpan(
                    text: "Terms and Conditions",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Terms tap
                            debugPrint("Terms and Conditions clicked");
                          },
                  ),
                  const TextSpan(text: " and the "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Privacy tap
                            debugPrint("Privacy Policy clicked");
                          },
                  ),
                  const TextSpan(text: "."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
