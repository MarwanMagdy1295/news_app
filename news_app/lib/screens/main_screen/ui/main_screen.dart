import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/color.dart';
import 'package:news_app/core/constant.dart';
import 'package:news_app/core/loading.dart';
import 'package:news_app/screens/main_screen/ui/news_list.dart';
import 'package:news_app/screens/main_screen/ux/cubit.dart';
import 'package:news_app/screens/main_screen/ux/states.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MainScreenCubit()..getNews(categoryName: ''),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<MainScreenCubit>();
          return BlocBuilder<MainScreenCubit, MainScreenStates>(
            builder: (state, index) {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: kSpecialTextFieldHintColor,
                    title: const Text(
                      'News',
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                  body: Column(
                    children: [
                      heght10,
                      SizedBox(
                        height: Platform.isAndroid
                            ? MediaQuery.sizeOf(context).height * .05
                            : MediaQuery.sizeOf(context).height * .05,
                        child: ListView.builder(
                          itemCount: cubit.categories.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                if (cubit.categoryIndex == index) {
                                } else {
                                  setState(
                                    () {
                                      cubit.categoryName =
                                          cubit.categories[index];
                                      cubit.categoryIndex = index;
                                      cubit.getNews(
                                          categoryName:
                                              cubit.categoryName == 'All'
                                                  ? ''
                                                  : cubit.categoryName);
                                    },
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: cubit.categoryIndex == index
                                      ? primary
                                      : kWhiteColor,
                                  border: Border.all(color: kBlackColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    cubit.categories[index],
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: kBlackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      heght10,
                      cubit.isLoading
                          ? const Expanded(child: CustomLoading())
                          : cubit.articles.isEmpty
                              ? Expanded(
                                  child: Center(
                                    child: Lottie.network(
                                      'https://lottie.host/adb4e1de-85c5-4352-b20e-0d3f94f1b8fd/OSdBfj0V1y.json',
                                    ),
                                  ),
                                )
                              : NewsList(cubit: cubit),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
