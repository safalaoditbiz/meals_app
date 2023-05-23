import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_cubit.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';
import 'package:meals_app/screens/detailscreen.dart';

class Namecatscreen extends StatefulWidget {
  const Namecatscreen({super.key});

  @override
  State<Namecatscreen> createState() => _NamecatscreenState();
}

class _NamecatscreenState extends State<Namecatscreen> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 235, 149),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "The Meals",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        // leading: Icon(
        //   Icons.arrow_back_ios_new,
        //   size: 18,
        //   color: Colors.black,
        // ),
      ),
      backgroundColor: Color.fromARGB(255, 244, 235, 149),
      body: BlocBuilder<NamecatCubit, NamecatState>(builder: (context, state) {
        if (state is Loadedstate4) {
          return ListView.builder(
              itemCount: state.namecatmodel.meals!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (() {
                    BlocProvider.of<MealdetailCubit>(context).getmeals2(
                        id: state.namecatmodel.meals![index]["idMeal"]!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Detailscreen())));
                  }),
                  child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image(
                                    image: NetworkImage(state.namecatmodel
                                        .meals![index]["strMealThumb"]!),
                                    height: 50,
                                    width: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      state.namecatmodel.meals![index]
                                          ["idMeal"]!,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 244,
                                  child: Expanded(
                                    child: Text(
                                      state.namecatmodel.meals![index]
                                          ["strMeal"]!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))),
                );
              });
        }
        if (state is Loadingstate2) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        }
        return SizedBox();
      }),
    );
  }
}
