import 'package:flutter_test/flutter_test.dart';

// Dicionário que armazena o nome dos alunos e suas respectivas notas.
Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

void main() {
  print('Impressão da lista dos 3 alunos e notas iniciais $alunos');
  // Testa a inclusão de um novo aluno usando putIfAbsent().
  test('Adicionar elemento', () {
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
    // Impressão após adição de Elena.
    print('Impressão após adição de Elena: $alunos');
    // Verifica se a chave Elena foi adicionada ao dicionário.
    expect(alunos.containsKey('Elena'), isTrue);
    // Verifica se as notas de Elena foram registradas corretamente.
    expect(alunos['Elena'], [9.0, 8.0]);
  });
  // Testa a inclusão de vários alunos usando addAll().
  test('Adicionar outro dicionário', () {
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });
    // Impressão após inclusão de Elena e Luiza, como Elena já existia não imprime a 2ª.
    print('Impressão após inclusão de Elena e Luiza: $alunos');
    // Verifica se Elena foi adicionada.
    expect(alunos.containsKey('Elena'), isTrue);
    // Verifica se Luiza foi adicionada.
    expect(alunos.containsKey('Luiza'), isTrue);
  });
  // Testa a remoção de um aluno usando remove().
  test('Remover elemento', () {
    alunos.remove('Bruna');
    // Impressão após de remoção e Bruna.
    print('Impressão após a remoção de Bruna: $alunos');
    // Confirma que Bruna não está mais no dicionário.
    expect(alunos.containsKey('Bruna'), isFalse);
  });
  // Testa a atualização das notas de um aluno usando update().
  test('Atualizar elemento', () {
    alunos.update('Carla', (value) => [9.0, 8.0]);
    // Impressão após teste de atualização da nota de Carla.
    print('Impressão após atualização da nota de Carla: $alunos');
    // Verifica se as notas de Carla foram atualizadas.
    expect(alunos['Carla'], [9.0, 8.0]);
    // Outra forma de atualizar diretamente as notas de Carla.
    alunos['Carla'] = [8.0, 9.0];
    // Impressão após teste de atualização da nota de Carla de outra forma.
    print(
      'Impressão após atualização da nota de Carla de outro forma: $alunos',
    );
    // Confirma o novo valor das notas de Carla.
    expect(alunos['Carla'], [8.0, 9.0]);
  });
  // Testa o acesso às chaves, aos valores e a leitura do dicionário.
  test('Testar percorrer dicionário', () {
    // Verifica a sequência das chaves existentes no dicionário.
    expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);
    // Verifica a sequência dos valores armazenados.
    expect(alunos.values, [
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ]);
    // Variável utilizada para acumular todas as notas.
    double soma = 0;
    // Percorre cada aluno e suas respectivas notas.
    alunos.forEach((key, value) {
      // Percorre cada nota do aluno atual.
      for (double nota in value) {
        soma += nota;
      }
    });
    //Imprime a soma de todas as notas.
    print('Soma de todas as nota é: $soma');
    // Confirma a soma total de todas as notas.
    expect(soma, 68.0);
  });
  // Testa o cálculo da média das notas de cada aluno.
  test('Calcular médias', () {
    // Dicionário que armazenará o nome do aluno e sua média.
    Map<String, double> medias = {};
    // Percorre cada aluno e sua lista de notas.
    alunos.forEach((nome, notas) {
      double soma = 0;

      for (double nota in notas) {
        soma += nota;
      }
      // Calcula a média dividindo a soma pela quantidade de notas.
      medias[nome] = soma / notas.length;
    });
    // Imprime as médias calculadas de todos os alunos.
    print('Impressão das médias de todos os alunos: $medias');
    // Confirma se as médias foram calculadas corretamente.
    expect(medias, {'Maria': 8.5, 'Carla': 8.5, 'Elena': 8.5, 'Luiza': 8.5});
  });
}
