// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/color.dart';
import 'package:news_app/helpers/di_service.dart';
import 'package:news_app/helpers/navigator_key.dart';
import 'package:news_app/screens/main_screen/ui/main_screen.dart';
import 'package:news_app/screens/main_screen/ux/cubit.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenCubit>(
          lazy: false,
          create: (context) => di(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          fontFamily: 'Cairo',
          sliderTheme: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
            thumbColor: kLightBlueColor,
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all(primary),
          ),
          scaffoldBackgroundColor: kWhiteColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBlueColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
            centerTitle: true,
            toolbarTextStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            foregroundColor: kWhiteColor,
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
