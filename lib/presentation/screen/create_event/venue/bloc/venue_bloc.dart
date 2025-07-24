import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/model/response/venue_list_dto_response.dart';
import 'package:flutter_my_event/data/repository/venue_repository.dart';

part 'venue_event.dart';
part 'venue_state.dart';

class VenueBloc extends Bloc<VenueEvent, VenueState> {
  final _logger = AppLogger.getLogger('VenueBloc');
  late final VenueRepository _venueRepository;

  VenueBloc({required VenueRepository venueRepository})
    : _venueRepository = venueRepository,
      super(const VenueState()) {
    on<OnInitVenueEvent>(_onInitVenue);
  }

  Future<void> _onInitVenue(
    OnInitVenueEvent event,
    Emitter<VenueState> emit,
  ) async {
    _logger.debug("onInitVenue");

    try {
      emit(state.copyWith(fetchVenueStatus: FetchVenueStatus.loading));
      final VenueListDtoResponse venueListDtoResponse =
          await _venueRepository.getVenueList();

      final List<Venue> venues = venueListDtoResponse.venues;
      emit(
        state.copyWith(
          fetchVenueStatus: FetchVenueStatus.success,
          venues: venues,
        ),
      );
    } catch (e) {
      _logger.error(e);
      emit(state.copyWith(fetchVenueStatus: FetchVenueStatus.error));
    }
  }
}
