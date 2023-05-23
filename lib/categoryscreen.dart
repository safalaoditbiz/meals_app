import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_state.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';
import 'package:meals_app/screens/namecatscree.dart';

class Categorysrceen extends StatefulWidget {
  const Categorysrceen({super.key});

  @override
  State<Categorysrceen> createState() => _CategorysrceenState();
}

class _CategorysrceenState extends State<Categorysrceen> {
  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).getmeals3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 235, 149),
      body:
          BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
        if (state is Loadedstate3) {
          return Column(children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 40.0,
              ),
              child: Text(
                "Meals App",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230, top: 20),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 618,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: state.categorymodel.categories!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: (() {
                          BlocProvider.of<NamecatCubit>(context).getmeals4(
                            name: state
                                .categorymodel.categories![index].strCategory
                                .toString(),
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Namecatscreen()));
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Container(
                                  //     height: 20,
                                  //     width: 20,
                                  //     decoration: BoxDecoration(
                                  //         color: Colors.black,
                                  //         borderRadius:
                                  //             BorderRadius.circular(80)),
                                  //     child: Center(
                                  //       child: Text(
                                  //         state.categorymodel.categories![index]
                                  //             .idCategory
                                  //             .toString(),
                                  //         style: TextStyle(
                                  //             color: Colors.white,
                                  //             fontSize: 16,
                                  //             fontWeight: FontWeight.w900),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 45.0, bottom: 10, top: 8),
                                    child: Text(
                                      state.categorymodel.categories![index]
                                          .strCategory
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                              Image(
                                image: NetworkImage(state.categorymodel
                                    .categories![index].strCategoryThumb
                                    .toString()),
                                height: 100,
                                width: 400,
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     state.categorymodel.categories![index]
                              //         .strCategoryDescription
                              //         .toString(),
                              //     style: TextStyle(fontSize: 4),
                              //   ),
                              // ),
                              // Text(state.detailmodel.meals![0]["strCategory"]!),
                              // Text(state.detailmodel.meals![0]["idMeal"]!),
                              // Text(state.detailmodel.meals![0]["strArea"]!),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ]);
        }
        if (state is Loadingstate3) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        }
        return SizedBox(
          height: 150,
          child: Container(
            color: Colors.white,
          ),
        );

        // if (state is LoadingState) {

        // }
        // if (state is ErrorState) {

        // }
      }),
    );
  }
}
