import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/main_screen/ux/states.dart';

class MainScreenCubit extends Cubit<MainScreenStates> {
  MainScreenCubit() : super(MainInitialState());
}
