
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'color_event.dart';
part 'color_state.dart';


class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    on<ChangeColorEvent>((event, emit) {
       var randomColors = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      emit(ColorState(color: randomColors));
    });
  }
}


class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

