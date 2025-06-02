import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../local/hive_storage.dart';
import '../model/language_option.dart';
import 'language_event.dart';
import 'language_state.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GlobalStorage _globalStorage;
  bool _isLanguageOptionExpanded = false;
  List<LanguageOption> filteredLanguages = [];
  final BuildContext context;
  LanguageBloc(this._globalStorage, this.context)
      : super(LanguageInitial(_globalStorage.languageCode)) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<ToggleLanguageOptionExpansion>(_onToggleLanguageOptionExpansion);
    on<SearchLanguageEvent>(_onSearchLanguage);
  }

 void _onChangeLanguage(ChangeLanguageEvent event, Emitter<LanguageState> emit) {
  print("🔄 Đổi ngôn ngữ sang: ${event.locale}");
  _globalStorage.languageCode = event.locale;
  context.setLocale(event.locale);
  emit(LanguageChanged(event.locale));
}


  final List<LanguageOption> _languageOptions = [
    LanguageOption(
      locale: const Locale('en'),
      displayName: 'English',
      flagIcon: "assets/svg/language_icon/england-svgrepo-com.svg",
    ),
    LanguageOption(
      locale: const Locale('vi'),
      displayName: 'Việt Nam',
      flagIcon: "assets/svg/language_icon/vietnam-svgrepo-com.svg",
    ),
  ];

  List<LanguageOption> getLanguageOptions() => _languageOptions;

  Locale getSelectedLanguage() => _globalStorage.languageCode;

  void _onToggleLanguageOptionExpansion(
      ToggleLanguageOptionExpansion event, Emitter<LanguageState> emit) {
    _isLanguageOptionExpanded = !_isLanguageOptionExpanded;
    emit(LanguageToggleState(!_isLanguageOptionExpanded));
  }

  void _onSearchLanguage(
      SearchLanguageEvent event, Emitter<LanguageState> emit) {
    try {
      filteredLanguages = event.query.isEmpty
          ? _languageOptions
          : _languageOptions
              .where(
                (option) => option.displayName
                    .toLowerCase()
                    .contains(event.query.toLowerCase()),
              )
              .toList();
      emit(LanguageSearchState(event.query, filteredLanguages));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
