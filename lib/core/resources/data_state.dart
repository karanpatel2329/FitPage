
import 'package:equatable/equatable.dart';

abstract class DataState<T> extends Equatable {}

class Success<T> extends DataState<T> {
  final T data;

  Success(this.data);
  @override
  List<Object?> get props => [data];
}

class Failure<T> extends DataState<T> {
  final String message;
  
  Failure(this.message);
  @override
  List<Object?> get props => [message];
}
