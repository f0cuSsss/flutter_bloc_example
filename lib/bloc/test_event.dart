part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class TestStart extends TestEvent {}

class AddItem extends TestEvent {
  final String item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}
