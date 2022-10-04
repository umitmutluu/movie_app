part of 'move_detail_bloc.dart';

@immutable
abstract class MoveDetailState {}

class MoveDetailInitialState extends MoveDetailState {}
class MoveDetailLoadingState extends MoveDetailState {
  final bool isLoading;

  MoveDetailLoadingState(this.isLoading);
}
class MoveDetailItemSuccessState extends MoveDetailState {
  final MovieDetailModel items;

  MoveDetailItemSuccessState(this.items);
}
class MoveDetailErrorState extends MoveDetailState {}
