part of 'catering_bloc.dart';

sealed class CateringEvent extends Equatable {
  const CateringEvent();

  @override
  List<Object> get props => [];
}

class OnInitCateringEvent extends CateringEvent {
  const OnInitCateringEvent();

  @override
  List<Object> get props => [];
}

class OnSelectCatererEvent extends CateringEvent {
  final int selectedCatererId;

  const OnSelectCatererEvent({required this.selectedCatererId});

  @override
  List<Object> get props => [selectedCatererId];
}
