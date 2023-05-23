part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class Initialstate3 extends CategoryState {}

class Loadingstate3 extends CategoryState {}

class Loadedstate3 extends CategoryState {
  Loadedstate3({required this.categorymodel});

  final Categorymodel categorymodel;
}

class Errorstate3 extends CategoryState {}
