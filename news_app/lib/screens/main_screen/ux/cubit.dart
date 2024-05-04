import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/helpers/di_service.dart';
import 'package:news_app/screens/main_screen/data/models/news_model.dart';
import 'package:news_app/screens/main_screen/data/repository/main_screen_repository.dart';
import 'package:news_app/screens/main_screen/ux/states.dart';

class MainScreenCubit extends Cubit<MainScreenStates> {
  MainScreenCubit() : super(MainInitialState());
  static MainScreenCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  bool isLoadingPagination = false;
  int currentPage = 1;
  String? categoryName = '';
  final TrackingScrollController scrollController = TrackingScrollController();
  final MainScreenRepository _mainScreenRepository =
      MainScreenRepository(mainScreenRepository: di());
  NewsModel? newsModel;
  List<Article> articles = [];

  List<String> categories = [
    'All',
    'Business',
    'Health',
    'Science',
    'Technology'
  ];

  bool onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.mostRecentlyUpdatedPosition!.maxScrollExtent >
              scrollController.offset &&
          scrollController.mostRecentlyUpdatedPosition!.maxScrollExtent -
                  scrollController.offset <=
              50) {
        if (!isLoading) {
          getNews(isPagination: true, categoryName: categoryName);
        }
      }
    }
    return true;
  }

  Future<void> getNews(
      {required String? categoryName, bool isPagination = false}) async {
    isLoading = true;
    emit(MainLoadingState());
    if (isPagination) {
      isLoadingPagination = true;
    }
    if (isPagination) {
      if (articles.length >= newsModel!.totalResults!) {
        isLoading = false;
        isLoadingPagination = false;
        return;
      } else {
        currentPage++;
      }
    } else {
      currentPage = 1;
      articles.clear();
    }
    await _mainScreenRepository
        .getNews(category: categoryName, pageSize: 10, pageNumber: currentPage)
        .then((value) {
      newsModel = value;
      articles.addAll(value!.articles!);
      print('newsModel =>  $newsModel');
      print('articles list=>  $articles');
      emit(MainLoadingState());
      isLoading = false;
    }).catchError((onError) {
      emit(MainLoadingState());
      isLoading = false;
      print('categoryItem error=>  $onError');
    });
  }
}
