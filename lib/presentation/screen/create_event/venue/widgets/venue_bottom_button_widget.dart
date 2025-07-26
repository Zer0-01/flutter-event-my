import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/venue/bloc/venue_bloc.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';

class VenueBottomButtonWidget extends StatelessWidget {
  const VenueBottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VenueBloc, VenueState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
            ),
          ),
          child: BottomAppBar(
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      context.router.pop();
                    },
                    child: const Text("Previous"),
                  ),
                ),
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed:
                        state.selectedVenueId.isNegative
                            ? null
                            : () {
                              context.router.pushPath(RoutePath.catering);
                            },
                    child: const Text("Next"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
