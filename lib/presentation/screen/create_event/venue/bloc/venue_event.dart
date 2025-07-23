part of 'venue_bloc.dart';

sealed class VenueEvent extends Equatable {
  const VenueEvent();

  @override
  List<Object> get props => [];
}

class OnInitVenueEvent extends VenueEvent {
  const OnInitVenueEvent();
}
