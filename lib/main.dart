import 'package:bhd_star/presentation/pages/home/bloc/movie_bloc.dart';
import 'package:bhd_star/presentation/router/app_routers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/di/locator.dart';
import 'core/local/hive_storage.dart';
import 'core/utils/helpers/network_manager/bloc/network_bloc.dart';
import 'core/utils/theme/bloc/theme_bloc.dart';
import 'core/utils/translations/bloc/language_bloc.dart';
import 'core/utils/translations/bloc/language_state.dart';

ServiceLocator dependencyInjector = ServiceLocator();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  dependencyInjector.servicesLocator();
  await EasyLocalization.ensureInitialized();
  await Hive.openBox(GlobalStorageKey.globalStorage);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      startLocale: const Locale('vi'),
      fallbackLocale: const Locale('vi'),
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc(getIt<GlobalStorage>())),
        BlocProvider(
          create: (_) => LanguageBloc(getIt<GlobalStorage>(), context),
        ),
        BlocProvider(create: (_) => NetworkBloc(Connectivity(), context)),
        BlocProvider(create: (context) => MovieBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'BHD Star',
                locale: context.locale,
                theme: state.appTheme,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                routerDelegate: AppRouters.router.routerDelegate,
                routeInformationParser:
                    AppRouters.router.routeInformationParser,
                routeInformationProvider:
                    AppRouters.router.routeInformationProvider,
              );
            },
          );
        },
      ),
    );
  }
}
