// ignore_for_file: avoid_print

import 'dart:io';

import 'game.dart';

import 'chackGame.dart';

void main() {
  late GuessResult guessResult;

  var chack = ChackGame();
  do {
    stdout.write('Enter a maximum number to random:☛ ');
    var setup = stdin.readLineSync();
    if (setup == null) {
      //print('Error, input is NULL');
      return;
    }
    var setupGame = int.tryParse(setup);
    if (setupGame == null) {
      //print('Input error, please enter numbers only');
      continue;
    }
    var game = Game(setupGame);
    print('╔══════════════════════════════════════════════════');
    print('║              GUESS THE NUMBER  new              ');
    print('║──────────────────────────────────────────────────');

    do {
      stdout.write('║  Guess the number between 1 and $setupGame :☛ ');

      var input = stdin.readLineSync();

      if (input == null) {
        //print('Error, input is NULL');
        return;
      }

      var guess = int.tryParse(input);

      if (guess == null) {
        //print('Input error, please enter numbers only');
        continue;
      }

      guessResult = game.doGuess(guess);

      if (guessResult == GuessResult.correct) {
        print('║  ➜ $guess is CORRECT  ❤️, total guesses: ${game.totalGuesses}');
        print('║──────────────────────────────────────────────────');
        print('║                    THE END                       ');
        print('╚══════════════════════════════════════════════════');
        chack.listGuesses.add(game.totalGuesses);
      } else if (guessResult == GuessResult.tooHigh) {
        print('║  ➜ $guess is TOO HIGH! ▲');
        print('║──────────────────────────────────────────────────');
      } else {
        print('║  ➜ $guess is TOO LOW! ▼');
        print('║──────────────────────────────────────────────────');
      }
    } while (guessResult != GuessResult.correct);
  } while (chack.playAgain());
}
