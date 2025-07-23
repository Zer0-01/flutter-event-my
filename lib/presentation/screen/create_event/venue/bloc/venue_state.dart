part of 'venue_bloc.dart';

enum FetchVenueStatus { initial, loading, success, error }

class VenueState extends Equatable {
  final FetchVenueStatus fetchVenueStatus;

  const VenueState({this.fetchVenueStatus = FetchVenueStatus.initial});

  VenueState copyWith({FetchVenueStatus? fetchVenueStatus}) {
    return VenueState(
      fetchVenueStatus: fetchVenueStatus ?? this.fetchVenueStatus,
    );
  }

  @override
  List<Object> get props => [fetchVenueStatus];
}
