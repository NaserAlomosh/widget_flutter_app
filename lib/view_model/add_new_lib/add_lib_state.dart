part of 'add_lib_cubit.dart';

sealed class AddNewLibState {}

final class AddNewLibInitial extends AddNewLibState {}

final class AddNewLoadingState extends AddNewLibState {}

final class AddNewSucssesState extends AddNewLibState {}

final class AddNewErrorState extends AddNewLibState {}
