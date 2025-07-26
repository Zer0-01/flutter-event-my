import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/model/response/catering_list_dto_response.dart';
import 'package:flutter_my_event/data/repository/catering_repository.dart';

part 'catering_event.dart';
part 'catering_state.dart';

class CateringBloc extends Bloc<CateringEvent, CateringState> {
  final _logger = AppLogger.getLogger("CateringBloc");
  late final CateringRepository _cateringRepository;

  CateringBloc({required CateringRepository cateringRepository})
    : _cateringRepository = cateringRepository,
      super(const CateringState()) {
    on<OnInitCateringEvent>(_onInitCatering);
    on<OnSelectCatererEvent>(_onSelectCaterer);
  }

  Future<void> _onInitCatering(
    OnInitCateringEvent event,
    Emitter<CateringState> emit,
  ) async {
    _logger.debug("onInitCatering");

    try {
      final CateringListDtoResponse cateringListDtoResponse =
          await _cateringRepository.getCateringList();
      final List<Caterer> caterers = cateringListDtoResponse.caterers;

      emit(state.copyWith(caterers: caterers));
    } catch (e) {
      _logger.error(e);
    }
  }

  void _onSelectCaterer(
    OnSelectCatererEvent event,
    Emitter<CateringState> emit,
  ) {
    emit(state.copyWith(selectedCatererId: event.selectedCatererId));
  }
}
