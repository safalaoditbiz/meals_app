import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meals_app/model/namecatmodel.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'namecat_state.dart';

class NamecatCubit extends Cubit<NamecatState> {
  NamecatCubit() : super(NamecatInitial());
  @override
  getmeals4({String? name}) async {
    emit(Initialstate());
    emit(Loadingstate2());

    try {
      final url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=$name";

      log("url" + url.toString());
      final response = await http.get(Uri.parse(url));
      final namecat = Namecatmodel.fromJson(json.decode(response.body));
      log(namecat.toString());
      emit(Loadedstate4(namecatmodel: namecat));
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
