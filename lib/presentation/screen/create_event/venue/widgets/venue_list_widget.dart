import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/data/model/response/venue_list_dto_response.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/bloc/venue_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/widgets/venue_card_widget.dart';

class VenueListWidget extends StatelessWidget {
  const VenueListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      sliver: BlocBuilder<VenueBloc, VenueState>(
        builder: (context, state) {
          return SliverList.separated(
            itemCount: state.venues.length,
            itemBuilder: (context, index) {
              final Venue venue = state.venues[index];
              final int id = venue.id;
              final String name = venue.placeName;
              final String address = venue.location.address;
              final String description = venue.description;
              final List<String> tags = venue.tags;
              final List<String> offered = venue.offered;
              final bool isSelected = id == state.selectedVenueId;
              return VenueCardWidget(
                id: id,
                name: name,
                description: description,
                address: address,
                tags: tags,
                offered: offered,
                isSelected: isSelected,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 4),
          );
        },
      ),
    );
  }
}
