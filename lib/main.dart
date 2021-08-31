import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/test_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TestBloc()
            ..add(
              TestStart(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Bloc Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          if (state is TestLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TestLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.model.length.toString()),
                  Text(
                    '',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    child: const Text('Add new item'),
                    onPressed: () {
                      context.read<TestBloc>().add(
                            const AddItem('New item'),
                          );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
