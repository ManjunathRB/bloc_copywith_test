part of 'copywith_bloc.dart';

sealed class CopywithEvent extends Equatable {
  const CopywithEvent();

  @override
  List<Object> get props => [];
}

class CopyWithIntialEvent extends CopywithEvent {}

class SelectedIndexEvent extends CopywithEvent {
  final int index;

  const SelectedIndexEvent(this.index);
}
