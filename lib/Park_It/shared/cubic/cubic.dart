import 'package:bloc/bloc.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:f/Park_It/shared/cubic/state.dart';

import '../../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>
{

  AppCubit() : super(AppInitialState());


  static AppCubit get(context)=> BlocProvider.of(context);

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;
  void changeAppMode({ bool? fromShared})
  {
    if (fromShared !=null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    }else{
      isDark = !isDark;

      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value){
        emit(AppChangeModeState());
      });
      emit(AppChangeModeState() );
    }
  }
}