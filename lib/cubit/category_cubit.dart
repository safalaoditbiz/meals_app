import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meals_app/model/categorymodel.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(Initialstate3());

  @override
  getmeals3() async {
    emit(Initialstate3());
    emit(Loadingstate3());

    try {
      const url = "http://www.themealdb.com/api/json/v1/1/categories.php";

      log("url" + url.toString());
      final response = await http.get(Uri.parse(url));
      final categories = Categorymodel.fromJson(json.decode(response.body));
      emit(Loadedstate3(categorymodel: categories));
      log("response" + response.statusCode.toString());
      if (response.statusCode == 200) {
        log("response" + response.toString());

        print(response.statusCode);
      }
    } catch (e) {
      emit(Errorstate3());
      log("eeeee" + e.toString());
    }
  }
}
