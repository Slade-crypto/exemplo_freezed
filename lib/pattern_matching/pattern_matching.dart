import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matching.freezed.dart';

@freezed
class Union with _$Union {
  factory Union(int value) = UnionData;
  factory Union.loading() = UnionLoading;
  factory Union.error(String? message) = UnionError;
}

void main() {
  var union = Union.loading();

  var mensagem = union.when<String>(
    (value) => 'Alguma coisa',
    loading: () => 'Loading',
    error: (String? message) => message!,
  );

  // print(mensagem);

  var mensagemMaybe = union.maybeWhen(
    null,
    loading: () => 'loading ',
    orElse: () => 'Caso não for loading, tem eu',
  );

  // print(mensagemMaybe);

  var mensagemMap = union.map(
    (value) => (UnionData value) => '${value.runtimeType} <-- tipo value',
    loading: (UnionLoading loading) => '${loading.runtimeType} <-- tipo loading',
    error: (UnionError error) => '${error.message.runtimeType} <-- tipo error',
  );

  // print(mensagemMap);

  var mensagemMaybeMap = union.maybeMap(
    null,
    loading: (UnionLoading loading) => 'Ta carregando :)',
    orElse: () => 'Não ta carregando :(',
  );

  print(mensagemMaybeMap);
}
