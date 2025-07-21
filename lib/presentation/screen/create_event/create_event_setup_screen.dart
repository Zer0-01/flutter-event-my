import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/bloc/create_event_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/create_event_screen.dart';

@RoutePage()
class CreateEventSetupScreen extends StatelessWidget {
  const CreateEventSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateEventBloc(),
      child: const CreateEventScreen(),
    );
  }
}
