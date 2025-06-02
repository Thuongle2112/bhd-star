import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../local/hive_storage.dart';
import '../theme.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GlobalStorage storage;

  ThemeBloc(this.storage)
    : super(
        storage.darkMode
            ? ThemeState(appTheme: TAppTheme.darkTheme)
            : ThemeState(appTheme: TAppTheme.lightTheme),
      ) {
    on<ChangeTheme>((event, emit) {
      emit(
        ThemeState(
          appTheme:
              event.isDarkMode ? TAppTheme.darkTheme : TAppTheme.lightTheme,
        ),
      );
      storage.darkMode = event.isDarkMode;
      updateSystemUI(event.isDarkMode);
    });
  }

  void updateSystemUI(bool isDarkMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarColor: isDarkMode ? Colors.white : Colors.black,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
