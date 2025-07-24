part of 'venue_bloc.dart';

enum FetchVenueStatus { initial, loading, success, error }

class VenueState extends Equatable {
  final FetchVenueStatus fetchVenueStatus;
  final List<Venue> venues;

  const VenueState({
    this.fetchVenueStatus = FetchVenueStatus.initial,
    this.venues = const [],
  });

  VenueState copyWith({
    FetchVenueStatus? fetchVenueStatus,
    List<Venue>? venues,
  }) {
    return VenueState(
      fetchVenueStatus: fetchVenueStatus ?? this.fetchVenueStatus,
      venues: venues ?? this.venues,
    );
  }

  @override
  List<Object> get props => [fetchVenueStatus, venues];
}
