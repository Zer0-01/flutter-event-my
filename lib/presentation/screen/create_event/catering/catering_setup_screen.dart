import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/data/repository/catering_repository.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/bloc/catering_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/catering_screen.dart';

@RoutePage()
class CateringSetupScreen extends StatelessWidget {
  const CateringSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CateringBloc(cateringRepository: CateringRepository()),
      child: const CateringScreen(),
    );
  }
}
