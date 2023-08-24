part of 'copywith_bloc.dart';

enum Status { initial, loading, success }

class CopywithState extends Equatable {
  const CopywithState(this.names, this.index, this.status);
  final List<String> names;
  final int index;
  final Status status;

  CopywithState copyWith({List<String>? names, int? index, Status? status}) {
    return CopywithState(
        names ?? this.names, index ?? this.index, status ?? this.status);
  }

  @override
  List<Object> get props => [names, index, status];
}
