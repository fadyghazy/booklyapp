
import 'package:booklyappproject/core/utils/api_service.dart';
import 'package:booklyappproject/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyappproject/features/home/presentation/manager/newsest_books_cubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repository/home_repo.implementation.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks(),),
        BlocProvider(create: (context)=>NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        title: 'BooklyApp',
        theme: ThemeData.dark().copyWith( scaffoldBackgroundColor:primarycolor,textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}