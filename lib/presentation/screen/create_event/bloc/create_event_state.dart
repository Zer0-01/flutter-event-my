part of 'create_event_bloc.dart';

class CreateEventState extends Equatable {
  final String category;
  final int selectedCateringId;

  const CreateEventState({this.category = '', this.selectedCateringId = -1});

  CreateEventState copyWith({String? category, int? selectedCateringId}) {
    return CreateEventState(
      category: category ?? this.category,
      selectedCateringId: selectedCateringId ?? this.selectedCateringId,
    );
  }

  @override
  List<Object> get props => [category, selectedCateringId];
}
