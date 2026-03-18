import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/service_locator.dart';
import 'package:test2/features/home/data/repos/book_details_repo/book_details_repo.dart';
import 'package:test2/features/home/presentation/manager/get_book_information_cubit/get_book_information_cubit.dart';
import 'package:test2/features/home/presentation/views/book_details_view.dart';
import 'package:test2/features/home/presentation/views/home_view.dart';
import 'package:test2/features/search/presentation/views/search_view.dart';
import 'package:test2/features/splash/presentation/views/splash_view.dart';

sealed class AppRouter {
  static const String homeViewPath = '/homeView';
  static const String bookDetailsViewPath = '/bookDetailsViewPath';
  static const String searchViewPath = '/searchView';

  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: bookDetailsViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => GetBookInformationCubit(
              bookDetilasRepo: getIt<BookDetailsRepo>(),
            )..getBookDetailsFunction(id: state.extra as int),
            child: const BookDetailsView(),
          );
        },
      ),
      GoRoute(
        path: searchViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
