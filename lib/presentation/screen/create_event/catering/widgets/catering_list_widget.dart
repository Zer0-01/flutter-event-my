import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/data/model/response/catering_list_dto_response.dart';
import 'package:flutter_my_event/presentation/screen/create_event/bloc/create_event_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/bloc/catering_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/widgets/catering_card_widget.dart';

class CateringListWidget extends StatelessWidget {
  const CateringListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      sliver: BlocBuilder<CreateEventBloc, CreateEventState>(
        builder: (context, createEventState) {
          return BlocBuilder<CateringBloc, CateringState>(
            builder: (context, cateringState) {
              return SliverList.separated(
                itemCount: cateringState.caterers.length,
                itemBuilder: (context, index) {
                  final Caterer caterer = cateringState.caterers[index];
                  final int id = caterer.id;
                  final String name = caterer.companyName;
                  final String address = caterer.location.address;
                  final String description = caterer.description;
                  final List<String> tags = caterer.tags;
                  final List<String> services = caterer.services;
                  final bool isSelected =
                      id == createEventState.selectedCateringId;
                  return CateringCardWidget(
                    id: id,
                    name: name,
                    description: description,
                    address: address,
                    tags: tags,
                    services: services,
                    isSelected: isSelected,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 4),
              );
            },
          );
        },
      ),
    );
  }
}
