import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/home/widgets/event_type_section_widget.dart';
import 'package:flutter_my_event/presentation/screen/home/widgets/vendor_type_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "EventMY",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              spacing: 8,
              children: [EventTypeSectionWidget(), VendorTypeWidget()],
            ),
          ),
        ],
      ),
    );
  }
}
