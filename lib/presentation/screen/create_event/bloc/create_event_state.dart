part of 'create_event_bloc.dart';

class CreateEventState extends Equatable {
  final String category;

  const CreateEventState({this.category = ''});

  CreateEventState copyWith({String? category}) {
    return CreateEventState(category: category ?? this.category);
  }

  @override
  List<Object> get props => [category];
}
