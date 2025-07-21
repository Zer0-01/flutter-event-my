import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';

part 'create_event_event.dart';
part 'create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  final _logger = AppLogger.getLogger('CreateEventBloc');

  CreateEventBloc() : super(const CreateEventState()) {
    on<OnSelectCategoryEvent>(_onSelectCategory);
  }

  void _onSelectCategory(
    OnSelectCategoryEvent event,
    Emitter<CreateEventState> emit,
  ) {
    _logger.debug('OnSelectCategoryEvent: ${event.category}');
    emit(state.copyWith(category: event.category));
  }
}
