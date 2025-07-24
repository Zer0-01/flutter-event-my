import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/bloc/venue_bloc.dart';

class VenueCardWidget extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final String address;
  final List<String> tags;
  final List<String> offered;
  final bool isSelected;

  const VenueCardWidget({
    super.key,
    required this.name,
    required this.description,
    required this.address,
    required this.tags,
    required this.offered,
    required this.id,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color:
              isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(description),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                Text(
                  address.split(',').last,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 4,

              children:
                  tags
                      .map(
                        (tag) => Chip(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          label: Text(
                            tag,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
            Wrap(
              spacing: 4,
              children:
                  offered
                      .map(
                        (offer) => Chip(
                          backgroundColor: Colors.blue.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          label: Text(
                            offer,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("View Details"),
                  ),
                ),
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      context.read<VenueBloc>().add(OnSelectVenueEvent(id: id));
                    },
                    child: const Text("Select"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
