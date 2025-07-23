import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';

part 'venue_event.dart';
part 'venue_state.dart';

class VenueBloc extends Bloc<VenueEvent, VenueState> {
  final _logger = AppLogger.getLogger('VenueBloc');

  VenueBloc() : super(const VenueState()) {
    on<OnInitVenueEvent>(_onInitVenue);
  }

  Future<void> _onInitVenue(
    OnInitVenueEvent event,
    Emitter<VenueState> emit,
  ) async {
    _logger.debug("onInitVenue");
    emit(state.copyWith(fetchVenueStatus: FetchVenueStatus.loading));
  }
}
