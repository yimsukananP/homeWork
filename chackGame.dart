// ignore_for_file: avoid_print
import 'dart:io';

class ChackGame {
  List<int> listGuesses = [];

  ChackGame();

  bool playAgain() {
    do {
      stdout.write('Play again? (Y/N) ☛ ');
      var input = stdin.readLineSync();

      if (input == 'Y' || input == 'y') {
        return true;
      } else if (input == 'N' || input == 'n') {
        print('');
        print('╔═════════════════════════╗');
        print('║You\'ve played ${listGuesses.length} games    ║');
        for (int i = 0; i < listGuesses.length; i++) {
          print('║🚀 Game #${i + 1}: ${listGuesses[i]} guesses ❤️️');
        }
        print('╚═════════════════════════╝');
        return false;
      } else {
        continue;
      }
    } while (true);
  }
}
