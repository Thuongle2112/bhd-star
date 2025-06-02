import 'package:flutter/material.dart';


abstract class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final BuildContext context;
  final Locale locale;

  ChangeLanguageEvent(this.locale, this.context);
}

class ToggleLanguageOptionExpansion extends LanguageEvent {}

class SearchLanguageEvent extends LanguageEvent {
  final String query;

  SearchLanguageEvent(this.query);
}
