part of 'namecat_cubit.dart';

@immutable
abstract class NamecatState {}

class NamecatInitial extends NamecatState {}

class Initialstate extends NamecatState {}

class Loadingstate2 extends NamecatState {}

class Loadedstate4 extends NamecatState {
  Loadedstate4({required this.namecatmodel});

  final Namecatmodel namecatmodel;
}

class Errorstate extends NamecatState {}
