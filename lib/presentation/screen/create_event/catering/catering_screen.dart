import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/bloc/catering_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/widgets/catering_headline_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/widgets/catering_list_widget.dart';

class CateringScreen extends StatefulWidget {
  const CateringScreen({super.key});

  @override
  State<CateringScreen> createState() => _CateringScreenState();
}

class _CateringScreenState extends State<CateringScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CateringBloc>().add(const OnInitCateringEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [CateringHeadlineWidget(), CateringListWidget()],
      ),
    );
  }
}
