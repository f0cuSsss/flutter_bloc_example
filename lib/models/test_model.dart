import 'package:equatable/equatable.dart';

class TestModel extends Equatable {
  final List<String> items;

  const TestModel({required this.items});

  int get length => items.length;

  TestModel copyWith({
    List<String>? items,
  }) {
    return TestModel(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
