import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/categoryscreen.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_cubit.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(),
          ),
          BlocProvider<NamecatCubit>(
            create: (context) => NamecatCubit(),
          ),
          BlocProvider<MealdetailCubit>(
            create: (context) => MealdetailCubit(),
          ),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: Categorysrceen()));
  }
}
