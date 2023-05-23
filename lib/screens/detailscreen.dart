import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_state.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({
    super.key,
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  void initState() {
    // BlocProvider.of<MealdetailCubit>(context).getmeals2(name: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            )),
        body: BlocBuilder<MealdetailCubit, MealdetailState>(
            builder: (context, state) {
          log("st----------" + state.toString());
          if (state is Loadedstate2) {
            log(state.detailmodel.meals.toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(widget.name),
                  // ),

                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120)),
                          child: Image(
                            height: 250,
                            width: 400,
                            image: NetworkImage(
                                state.detailmodel.meals![0]["strMealThumb"]!),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.detailmodel.meals![0]["strMeal"]!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "this is a ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                state.detailmodel.meals![0]["strCategory"]!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                " item",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "meals id: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                state.detailmodel.meals![0]["idMeal"]!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "its a ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                state.detailmodel.meals![0]["strArea"]!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                " food",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        ),
                        // Text(state.detailmodel.meals![0]["strIngredient1"]!),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 244),
                          child: Text(
                            "How to prepare:-",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.detailmodel.meals![0]["strInstructions"]!,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          if (state is Loadingstate1) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          }
          return const SizedBox();
        }));
  }
}
