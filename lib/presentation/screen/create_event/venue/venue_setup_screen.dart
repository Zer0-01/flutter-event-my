import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/data/repository/venue_repository.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/bloc/venue_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/venue_screen.dart';

@RoutePage()
class VenueSetupScreen extends StatelessWidget {
  const VenueSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VenueBloc(venueRepository: VenueRepository()),

      child: const VenueScreen(),
    );
  }
}
