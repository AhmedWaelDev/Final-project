part of 'delete_account_cubit.dart';

sealed class DeleteAccountState extends Equatable {
  const DeleteAccountState();

  @override
  List<Object> get props => [];
}

final class DeleteAccountInitial extends DeleteAccountState {}

final class DeleteAccountFSuccess extends DeleteAccountState {}

final class DeleteAccountFLoading extends DeleteAccountState {}

final class DeleteAccountFailure extends DeleteAccountState {
  final String errMessage;

  const DeleteAccountFailure({required this.errMessage});
}
