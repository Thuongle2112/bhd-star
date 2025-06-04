import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie/movie_model.dart';
import 'movie_state.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieLoadEvent extends MovieEvent {}

class MovieTabChangedEvent extends MovieEvent {
  final MovieTab tab;

  MovieTabChangedEvent(this.tab);

  @override
  List<Object> get props => [tab];
}

class MovieChangedEvent extends MovieEvent {
  final int index;
  final Movie movie;

  MovieChangedEvent(this.index, this.movie);

  @override
  List<Object> get props => [index, movie];
}

class BannerChangedEvent extends MovieEvent {
  final int index;

  BannerChangedEvent(this.index);

  @override
  List<Object> get props => [index];
}

class FloatingAdPositionChangedEvent extends MovieEvent {
  final Offset position;

  FloatingAdPositionChangedEvent(this.position);

  @override
  List<Object> get props => [position];
}

class FloatingAdClosedEvent extends MovieEvent {}

class AppBarScrolledEvent extends MovieEvent {
  final double scrollOffset;

  AppBarScrolledEvent(this.scrollOffset);

  @override
  List<Object> get props => [scrollOffset];
}

class ToggleNavMenuEvent extends MovieEvent {
  final bool isOpen;

  ToggleNavMenuEvent(this.isOpen);

  @override
  List<Object> get props => [isOpen];
}
