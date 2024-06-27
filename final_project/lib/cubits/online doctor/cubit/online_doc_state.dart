part of 'online_doc_cubit.dart';

@immutable
abstract class OnlineDocState {}

class OnlineDocInitial extends OnlineDocState {}

class OnlineDocLoading extends OnlineDocState {}

class OnlineDocLoaded extends OnlineDocState {
  final List doctors;

  OnlineDocLoaded(this.doctors);
}

class OnlineDocError extends OnlineDocState {
  final String message;

  OnlineDocError(this.message);
}
