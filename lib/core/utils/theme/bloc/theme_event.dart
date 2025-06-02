
part of 'theme_bloc.dart';
abstract class ThemeEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final bool isDarkMode;

  ChangeTheme({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}