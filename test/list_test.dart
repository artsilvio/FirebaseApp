import 'package:flutter_test/flutter_test.dart';

// Lista inicial de números inteiros que será utilizada nos testes.
List<int> numeros = [1, 2, 3];

void main() {
  // Imprime os 3 primeiros elementos do array.
  print('Primeiros elementos do array: $numeros');
  // Testa a adição de um único elemento ao final da lista.
  test('Adicionar elemento', () {
    numeros.add(4);
    // Impressão após adição do elemento 4.
    print('Após adicionar 4: $numeros');
    // contains() verifica se o valor informado existe na lista.
    expect(numeros.contains(4), isTrue);
  });
  // Testa a adição de vários elementos de uma só vez.
  test('Adicionar outra lista', () {
    numeros.addAll([5, 6]);
    // Impressão após adição dos 5 e 6 elementos.
    print('Após adicionar 5 e 6: $numeros');
    // Confirma que os dois novos valores foram adicionados.
    expect(numeros.contains(5), isTrue);
    expect(numeros.contains(6), isTrue);
  });
  // Testa a inserção de um elemento em uma posição específica.
  test('Adicionar na posição', () {
    numeros.insert(0, 0);
    // indexOf() retorna o índice da primeira ocorrência do valor.
    expect(numeros.indexOf(0), 0);
  });
  // Testa a remoção de um elemento pelo seu valor.
  test('Remover elemento', () {
    numeros.remove(2);
    // Impressão após a remoção do elemento 2.
    print('Após remover 2: $numeros');
    // Verifica se o número 2 não está mais presente na lista.
    expect(numeros.contains(2), isFalse);
  });
  // Testa a remoção de um elemento utilizando seu índice.
  test('Remover na posição', () {
    numeros.removeAt(0);
    // Confirma que o elemento que estava no índice 0 foi removido.
    expect(numeros.contains(0), isFalse);
  });
  // Testa a quantidade atual de elementos da lista.
  test('Testar tamanho', () {
    expect(numeros.length, 5);
  });
  // Verifica se a lista está vazia ou possui elementos.
  test('Testar vazio e não vazio', () {
    expect(numeros.isEmpty, isFalse);
    expect(numeros.isNotEmpty, isTrue);
  });
  // Testa a inversão da ordem e a ordenação crescente dos elementos.
  test('Testar ordenação', () {
    expect(numeros.reversed.toList(), [6, 5, 4, 3, 1]);
    expect(numeros, [1, 3, 4, 5, 6]);
    // reversed cria uma sequência invertida; toList() transforma em lista.
    numeros = numeros.reversed.toList();
    expect(numeros, [6, 5, 4, 3, 1]);
    // sort() organiza os números em ordem crescente.
    numeros.sort();
    expect(numeros, [1, 3, 4, 5, 6]);
  });
  // Testa a leitura dos elementos e operações funcionais da lista.
  test('Testar percorrer lista', () {
    int soma = 0;
    // O for-in percorre cada elemento da lista sequencialmente.
    for (int numero in numeros) {
      soma += numero;
    }
    expect(soma, 19);
    // map() aplica uma transformação em cada elemento da lista.
    numeros = numeros.map((numero) => numero * 2).toList();
    expect(numeros, [2, 6, 8, 10, 12]);
    // where() filtra os elementos que atendem à condição informada.
    numeros = numeros.where((numero) => numero % 3 == 0).toList();
    expect(numeros, [6, 12]);
  });
}
