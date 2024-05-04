import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/color.dart';
import 'package:news_app/core/constant.dart';
import 'package:news_app/core/loading.dart';
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
                  body: cubit.isLoading
                      ? const CustomLoading()
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              heght10,
                              SizedBox(
                                height: Platform.isAndroid
                                    ? MediaQuery.sizeOf(context).height * .05
                                    : MediaQuery.sizeOf(context).height * .03,
                                child: ListView.builder(
                                  itemCount: cubit.categories.length,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            cubit.categoryName =
                                                cubit.categories[index];
                                            cubit.getNews(
                                                categoryName:
                                                    cubit.categoryName == 'All'
                                                        ? ''
                                                        : cubit.categoryName);
                                          },
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .23,
                                        decoration: BoxDecoration(
                                            color: kWhiteColor,
                                            border:
                                                Border.all(color: kBlackColor)),
                                        child: Center(
                                          child: Text(cubit.categories[index],
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                color: kBlackColor,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                itemCount: cubit.articles.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final article = cubit.articles[index];
                                  return InkWell(
                                    onTap: () {
                                      // RouteManager.navigateTo(
                                      //   DocotorDetails(
                                      //     id: doctor.id.toString(),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: kBlackColor,
                                          )),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: Platform.isAndroid
                                                ? MediaQuery.sizeOf(context)
                                                        .height *
                                                    .12
                                                : MediaQuery.sizeOf(context)
                                                        .height *
                                                    .19,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                .23,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(article
                                                          .urlToImage ??
                                                      'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Title: ',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: secondry,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          .43,
                                                      child: Text(
                                                        article.title ?? 'NA',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 16.0,
                                                          color: secondry,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Author: ',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color:
                                                            Color(0xff717171),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          .43,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8.0),
                                                      child: Text(
                                                        article.author != null
                                                            ? article.author!
                                                            : 'NA',
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          color:
                                                              Color(0xff717171),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Source: ',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color:
                                                            Color(0xff717171),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          .43,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8.0),
                                                      child: Text(
                                                        article.source !=
                                                                    null &&
                                                                article.source
                                                                        ?.name !=
                                                                    null
                                                            ? article
                                                                .source!.name!
                                                            : 'NA',
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          color:
                                                              Color(0xff717171),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              if (cubit.isLoadingPagination)
                                const SizedBox(
                                  height: 50,
                                  child: CustomLoading(),
                                ),
                            ],
                          ),
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
