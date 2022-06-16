import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/color_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  Color? colorName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: BlocBuilder<ColorBloc, ColorState>(builder: (context, state) {
        return Scaffold(
          // backgroundColor: state.color,
          appBar: AppBar(
            title: const Text('Counter'),
            backgroundColor: state.color,
          ),
          body: Center(
            child: Stack(
              children: [
                BlocBuilder<CounterCubit, int>(
                  builder: (context, count) {
                    return Center(
                      child: Text(
                        '$count',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: state.color,
                            ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: GridView.builder(
                    itemCount: 12,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              shape: BoxShape.circle,
                              border: Border.all(width: 2)),
                        ),
                        onTap: (){
                          setState(() {
                            colorName = Colors.primaries[
                            Random().nextInt(Colors.primaries.length)];
                          });
                        },
                      );
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: colorName,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(
                  Icons.add,
                  color: state.color,
                ),
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
              ),
              const SizedBox(height: 4),
              FloatingActionButton(
                child: Icon(
                  Icons.remove,
                  color: state.color,
                ),
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
              ),
              const SizedBox(height: 4),
              FloatingActionButton(
                child: const Icon(Icons.brightness_6),
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
