import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_state.dart';
import 'package:meals_app/model/detailmodel.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class MealdetailCubit extends Cubit<MealdetailState> {
  MealdetailCubit() : super(Initialstate());

  @override
  getmeals2({String? id}) async {
    emit(Initialstate());
    emit(Loadingstate1());

    try {
      final url = "http://www.themealdb.com/api/json/v1/1/lookup.php?i=$id";

      log("url" + url.toString());
      final response = await http.get(Uri.parse(url));
      final details = Detailmodel.fromJson(json.decode(response.body));
      log(details.toString());
      emit(Loadedstate2(detailmodel: details));
      log("response" + response.statusCode.toString());
      log("res-------0" + response.toString());
      if (response.statusCode == 200) {
        log("response" + response.toString());

        print(response.statusCode);
      }
    } catch (e) {
      emit(Errorstate());
      log("eeeee" + e.toString());
    }
  }
}
