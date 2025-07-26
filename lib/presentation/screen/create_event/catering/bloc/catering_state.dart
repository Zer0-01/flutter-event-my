part of 'catering_bloc.dart';

class CateringState extends Equatable {
  final List<Caterer> caterers;
  final int selectedCatererId;

  const CateringState({this.caterers = const [], this.selectedCatererId = 0});

  CateringState copyWith({List<Caterer>? caterers, int? selectedCatererId}) {
    return CateringState(
      caterers: caterers ?? this.caterers,
      selectedCatererId: selectedCatererId ?? this.selectedCatererId,
    );
  }

  @override
  List<Object> get props => [caterers, selectedCatererId];
}
