part of 'venue_bloc.dart';

enum FetchVenueStatus { initial, loading, success, error }

class VenueState extends Equatable {
  final FetchVenueStatus fetchVenueStatus;
  final List<Venue> venues;
  final int selectedVenueId;

  const VenueState({
    this.fetchVenueStatus = FetchVenueStatus.initial,
    this.venues = const [],
    this.selectedVenueId = -1,
  });

  VenueState copyWith({
    FetchVenueStatus? fetchVenueStatus,
    List<Venue>? venues,
    int? selectedVenueId,
  }) {
    return VenueState(
      fetchVenueStatus: fetchVenueStatus ?? this.fetchVenueStatus,
      venues: venues ?? this.venues,
      selectedVenueId: selectedVenueId ?? this.selectedVenueId,
    );
  }

  @override
  List<Object> get props => [fetchVenueStatus, venues, selectedVenueId];
}
