import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('You have pushed the button this many times:'),
                    SizedBox(height: 10),

                    state is CounterNumChangedState
                        ? Text(state.counter.toString())
                        : Text('You do not pressed any number'),

                    TextButton.icon(
                      onPressed: () => context.read<CounterCubit>().decrementCounter(),
                      icon: Icon(Icons.remove),
                      label: Text('Minus'),
                    ),
                    TextButton.icon(
                      onPressed: () =>
                          context.read<CounterCubit>().incrementCounter(),
                      icon: Icon(Icons.add),
                      label: Text('Plus'),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

}
