import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/core/color.dart';
import 'package:news_app/core/loading.dart';
import 'package:news_app/helpers/navigator_key.dart';
import 'package:news_app/screens/main_screen/ux/cubit.dart';
import 'package:news_app/screens/news_details_screen/ui/news_details_screen.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.cubit,
  });

  final MainScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener(
        onNotification: cubit.onNotification,
        child: StatefulBuilder(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    controller: cubit.scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    itemCount: cubit.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      final article = cubit.articles[index];
                      return InkWell(
                        onTap: () {
                          RouteManager.navigateTo(
                            NewsDetailsScreen(
                              artical: article,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            color: lightGrey50Color,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: kBlackColor),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade600.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 10)
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: Platform.isAndroid
                                    ? MediaQuery.sizeOf(context).height * .14
                                    : MediaQuery.sizeOf(context).height * .12,
                                width: MediaQuery.sizeOf(context).width * .23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: NetworkImage(article.urlToImage ??
                                          'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Title: ',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: secondry,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  .43,
                                          child: Text(
                                            article.title ?? 'NA',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              color: secondry,
                                              fontWeight: FontWeight.w600,
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
                                            color: Color(0xff717171),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  .43,
                                          margin:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            article.author != null
                                                ? article.author!
                                                : 'NA',
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xff717171),
                                              fontWeight: FontWeight.w600,
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
                                            color: Color(0xff717171),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  .4,
                                          margin:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            article.source != null &&
                                                    article.source?.name != null
                                                ? article.source!.name!
                                                : 'NA',
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xff717171),
                                              fontWeight: FontWeight.w600,
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
                ),
                if (cubit.isLoadingPagination)
                  const SizedBox(
                    height: 50,
                    child: CustomLoading(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
