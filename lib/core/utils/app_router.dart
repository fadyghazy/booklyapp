import 'package:booklyappproject/core/utils/service_locator.dart';
import 'package:booklyappproject/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:booklyappproject/features/home/presentation/view/book_details_view.dart';
import 'package:booklyappproject/features/home/presentation/view/home_view.dart';
import 'package:booklyappproject/features/splash/presentation/view/widgets/book_splash_view_body.dart';
import 'package:booklyappproject/features/splash/presentation/view/widgets/splash_view2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/model/book_model/book_model.dart';
import '../../features/home/data/repository/home_repo.implementation.dart';
import '../../features/intro/intro_view.dart';
import '../../features/splash/presentation/view/splash_screen.dart';
import '../../features/welcome_screen/welcome_screen.dart';

abstract class AppRouter{
  static const KIntroView='/IntroView';
  static const KHomeView='/HomeView';
  static const KDetailsView='/DetailsView';
  static const KWelcomeView='/WelcomeView';
  static final router= GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const BookSplashScreenView(),
      ),

      GoRoute(
        path: KIntroView,
        builder: (context, state) => const IntroductionPageView(),
      ),
      /*GoRoute(
        path: KWelcomeView,
        builder: (context, state) => const WelcomeScreen(),
      ),*/
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context)=>SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
    ],
  );
  // بقى عندى class يسمى approuter فيه كل ال routes بتاعتى
  // وكل اللى انا حعمله انى حروح على الmaterial app.router حستدعى الappRouter.router واللى فيه كل الroutes بتاعتى وحقولك ازاى بننشا route دلوقتى
}
