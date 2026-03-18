import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/core/network/api_service.dart';
import 'package:test2/core/network/dio_client.dart';
import 'package:test2/core/utils/app_colors.dart';
import 'package:test2/core/utils/app_router.dart';
import 'package:test2/features/home/data/repos/home_repo/home_repo_implem.dart';
import 'package:test2/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'core/utils/service_locator.dart';

void main() {
  configureDependencies();
  runApp(Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            homeRepo: HomeRepoImplem(
              getIt<DioClient>(),
              apiService: ApiService(dioClient: getIt<DioClient>()),
            ),
          )..getFeaturedBooksFunction(),
        ),
        // BlocProvider(
        //   create: (context) => NewestBooksCubit(
        //     homeRepo: HomeRepoImplem(
        //       getIt<DioClient>(),
        //       apiService: ApiService(dioClient: getIt<DioClient>()),
        //     ),
        //   )..getNewestBooksFunction(),
        // ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.pimaryColor,
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
            titleSmall: TextStyle(color: Colors.white),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(foregroundColor: Colors.white),
          ),
        ),
      ),
    );
  }
}
