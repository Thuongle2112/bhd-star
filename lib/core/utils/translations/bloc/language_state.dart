  import 'package:flutter/material.dart';

  import '../model/language_option.dart';

  abstract class LanguageState {}

  class LanguageInitial extends LanguageState {
    final Locale locale;

    LanguageInitial(this.locale);
  }

  class LanguageChanged extends LanguageState {
    final Locale locale;

    LanguageChanged(this.locale);
  }


  class LanguageToggleState extends LanguageState {
    final bool isExpanded;

    LanguageToggleState(this.isExpanded);
  }

  class LanguageSearchState extends LanguageState {
    final String query;
    final List<LanguageOption> filteredLanguages;


    LanguageSearchState(this.query, this.filteredLanguages);
  }
