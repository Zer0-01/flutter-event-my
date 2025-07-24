part of 'venue_bloc.dart';

sealed class VenueEvent extends Equatable {
  const VenueEvent();

  @override
  List<Object> get props => [];
}

class OnInitVenueEvent extends VenueEvent {
  const OnInitVenueEvent();

  @override
  List<Object> get props => [];
}

class OnSelectVenueEvent extends VenueEvent {
  final int id;

  const OnSelectVenueEvent({required this.id});

  @override
  List<Object> get props => [id];
}
