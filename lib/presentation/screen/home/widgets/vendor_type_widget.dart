import 'package:flutter/material.dart';

class VendorTypeWidget extends StatelessWidget {
  const VendorTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Expanded(
                child: _getVendorWidget(
                  title: "Catering",
                  icon: Icons.food_bank,
                  context: context,
                ),
              ),
              Expanded(
                child: _getVendorWidget(
                  title: "Venue",
                  icon: Icons.place,
                  context: context,
                ),
              ),
              Expanded(
                child: _getVendorWidget(
                  title: "Photography",
                  icon: Icons.camera_alt,
                  context: context,
                ),
              ),
              Expanded(
                child: _getVendorWidget(
                  title: "Entertainment",
                  icon: Icons.star,
                  context: context,
                ),
              ),
              Expanded(
                child: _getVendorWidget(
                  title: "More",
                  icon: Icons.more_horiz,
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getVendorWidget({
    required String title,
    required IconData icon,
    required BuildContext context,
  }) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
