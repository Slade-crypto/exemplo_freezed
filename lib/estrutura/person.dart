import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({String? nome, int? idade}) => _Person;
}
// rodar o build runner / pc da facul não reconhece dart
