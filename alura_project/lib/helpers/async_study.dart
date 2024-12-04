// import 'dart:math';
//
// asyncStudy() {
//   esperandoFuncoesAssincronas();
// }
//
// void execucaoNormal() {
//   print('\nExecução normal:');
//   print('1');
//   print('2');
//   print('3');
//   print('4');
//   print('5');
// }
//
// void assincronismoBasico() {
//   print('\nAssincronismo básico:');
//   print('1');
//   print('2');
//   Future.delayed(Duration(seconds: 2), () {
//     print('3');
//   });
//   print('4');
//   print('5');
// }
//
// void usandoFuncoesAssincronas() {
//   print('\nUsando funções assíncronas:');
//   print('A');
//   print('B');
//   // print(getRandomInt(3)); //Instance of Future<int>
//   getRandomInt(3).then((value) {
//     print('O número aleatório é: $value');
//
//     // e se eu quiser que as coisas só aconteçam depois?
//   });
//   print('C');
//   print('D');
// }
//
// void esperandoFuncoesAssincronas() async {
//   print('\nEsperando funções assíncronas:');
//   print('A');
//   print('B');
//   int number = await getRandomInt(4);
//   print('O numero aleatório é: $number');
//   print('C');
//   print('D');
// }
//
// Future<int> getRandomInt(int time) async {
//   await Future.delayed(Duration(seconds: time));
//
//   Random rng = Random();
//   return rng.nextInt(10);
// }