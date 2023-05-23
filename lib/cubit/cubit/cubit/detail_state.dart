import 'package:flutter/cupertino.dart';
import 'package:meals_app/model/detailmodel.dart';

@immutable
abstract class MealdetailState {}

class Initialstate extends MealdetailState {}

class Loadingstate1 extends MealdetailState {}

class Loadedstate2 extends MealdetailState {
  Loadedstate2({required this.detailmodel});

  final Detailmodel detailmodel;
}

class Errorstate extends MealdetailState {}
