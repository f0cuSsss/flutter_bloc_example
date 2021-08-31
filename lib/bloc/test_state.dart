part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

class InitialState extends TestState {
  @override
  List<Object> get props => [];
}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final TestModel model;

  const TestLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class TestUpdated extends TestState {
  final String newItem;

  const TestUpdated({required this.newItem});

  @override
  List<Object> get props => [newItem];
}
