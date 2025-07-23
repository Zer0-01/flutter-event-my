import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/widgets/venue_headline_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/widgets/venue_list_widget.dart';

class VenueScreen extends StatelessWidget {
  const VenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [VenueHeadlineWidget(), VenueListWidget()],
      ),
    );
  }
}
