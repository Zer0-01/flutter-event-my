part of 'create_event_bloc.dart';

sealed class CreateEventEvent extends Equatable {
  const CreateEventEvent();

  @override
  List<Object> get props => [];
}

class OnSelectCategoryEvent extends CreateEventEvent {
  final String category;
  const OnSelectCategoryEvent({required this.category});
  @override
  List<Object> get props => [category];
}
