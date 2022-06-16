import 'package:flutter/material.dart';
import 'package:shopping/counterpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage()
    );
  }
}

//
// Container(
// color: state.color,
// child: Column(
// children: [
// FloatingActionButton(
// onPressed: () {
// context.read<ColorBloc>().add(ChangeColorEvent());
// },
// ),
//
// Text(context.watch<CounterCubit>().toString()),
//
//
// FloatingActionButton(
// onPressed: () {
// context.read<CounterCubit>().increment();
// },
// ),
// FloatingActionButton(
// onPressed: () {
// context.read<CounterCubit>().decrement();
// },
// ),
// ],
// ),
// );
