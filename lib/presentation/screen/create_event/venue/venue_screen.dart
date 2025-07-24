import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/bloc/venue_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/widgets/venue_bottom_button_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/widgets/venue_headline_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/widgets/venue_list_widget.dart';

class VenueScreen extends StatefulWidget {
  const VenueScreen({super.key});

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VenueBloc>().add(const OnInitVenueEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [VenueHeadlineWidget(), VenueListWidget()],
      ),
      bottomNavigationBar: VenueBottomButtonWidget(),
    );
  }
}
