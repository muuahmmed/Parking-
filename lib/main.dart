import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/layout/home/cubit/cubit.dart';
import 'package:f/Park_It/layout/logo/logo_screen.dart';
import 'Park_It/network/local/cache_helper.dart';
import 'Park_It/shared/bloc_observer.dart';
import 'Park_It/shared/cubic/cubic.dart';
import 'Park_It/shared/cubic/state.dart';
import 'firebase_options.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  //uId= CacheHelper.getData(key: 'uId') ;
  Bloc.observer =  const SimpleBlocObserver();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=>AppCubit(),),
        BlocProvider(create: (context)=>ParkingCubit()..getUserData(),),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
          listener:(context, state){} ,
          builder: (context, state){
            return  MaterialApp(
              /*theme: ThemeData(
                floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.red) ,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleSpacing:20.0,
                  iconTheme: IconThemeData( color: Colors.white),
                  titleTextStyle: TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(

                    statusBarBrightness:Brightness.dark ,
                    statusBarColor: Colors.white,
                    //statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor:Colors.white,
                  elevation: 0.0,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.deepOrange,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    elevation: 30.0
                ) ,
              ),*/
             //darkTheme: darkTheme,
              //themeMode:AppCubit.get(context).isDark?ThemeMode.dark : ThemeMode.light,


              theme: ThemeData(
                textTheme: const TextTheme(
                    bodyMedium: TextStyle(color: Colors.white),
                    titleSmall: TextStyle(color: Colors.white),
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.red) ,
                scaffoldBackgroundColor: const Color(0xff0d2331),
                appBarTheme: const AppBarTheme(
                  titleSpacing:20.0,
                  iconTheme: IconThemeData( color: Color(0xff0d2331)),
                  titleTextStyle: TextStyle(
                    color:  Color(0xff0d2331),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xff0d2331),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Color(0xff0d2331),
                  elevation: 0.0,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.deepOrange,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    elevation: 30.0
                ) ,
              ),

              home: const LogoScreen(),
              debugShowCheckedModeBanner: false,
            );
          },
        ),

    );
  }
}
