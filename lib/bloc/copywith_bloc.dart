import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'copywith_event.dart';
part 'copywith_state.dart';

List<String> nameList = [
  "Dart",
  "Flutter",
  "Python",
  "Java",
  "PHP",
  "NodeJS",
  "MongoDB",
  "FireBase"
];

class CopywithBloc extends Bloc<CopywithEvent, CopywithState> {
  CopywithBloc() : super(const CopywithState([], 0, Status.initial)) {
    on<CopyWithIntialEvent>(copywithevent);
    on<SelectedIndexEvent>(selectedIndexEvent);
  }

  FutureOr<void> copywithevent(
      CopyWithIntialEvent event, Emitter<CopywithState> emit) async {
    emit(const CopywithState([], 0, Status.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(CopywithState(nameList, 0, Status.success));
  }

  FutureOr<void> selectedIndexEvent(
      SelectedIndexEvent event, Emitter<CopywithState> emit) {
    emit(state.copyWith(
        names: nameList, index: event.index, status: Status.success));
  }
}
