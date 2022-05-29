import 'package:equatable/equatable.dart';

class AppState<R, L> extends Equatable {
  final R? data;
  final L? error;

  const AppState({this.data, this.error});

  @override
  List<Object?> get props => [
        data,
        error,
      ];
}
