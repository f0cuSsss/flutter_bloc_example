import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/models/test_model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(InitialState());

  @override
  Stream<TestState> mapEventToState(
    TestEvent event,
  ) async* {
    if (event is TestStart) {
      yield* _mapStartTestToState();
    } else if (event is AddItem) {
      yield* _mapAddItemToState(event, state);
    }
  }

  Stream<TestState> _mapStartTestToState() async* {
    yield TestLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const TestLoaded(model: TestModel(items: []));
    } catch (_) {}
  }

  Stream<TestState> _mapAddItemToState(
    AddItem event,
    TestState state,
  ) async* {
    if (state is TestLoaded) {
      try {
        yield TestLoaded(
          model: state.model.copyWith(
            items: List.from(state.model.items)..add(event.item),
          ),
        );
      } catch (_) {}
    }
  }
}
