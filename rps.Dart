import 'dart:io';
import 'dart:math';
void main(){
  var playerChoice;
  var random= Random();
  int playerScore, computerScore;
  print("Welcome to the Rock Peper and Scisors Game Press 1 to see the rules and 0 to exit :");
  int? schoice=int.tryParse(stdin.readLineSync()!);
  if(schoice !=null && schoice==1){
    var Rules={"Choice":"Peper,Scissors,Rock","Round":"1--->10"};
    print(Rules);
  }
  else{
    print("Game Over");
    return;
  }
  print("Game Start Please select the number of rounds (1--->10):");
  int? rounds=int.tryParse(stdin.readLineSync()!);
  if(rounds == null || rounds < 1 || rounds > 10){
    print("Invalid number of rounds. Please enter a number between 1 and 10.");
    return;
  }
  playerScore=0;computerScore=0;
  List<String> choices=["Rock","Peper","Scissors"];
  for(int i=0;i<rounds;i++){
         var computerGuess=choices[random.nextInt(choices.length)];
         print("Round ${i+1}: Please select Rock, Peper, or Scissors:");
         var playerChoice=stdin.readLineSync();
         if(computerGuess=="Rock"){
          switch(playerChoice){
            case "Rock":
                        print("Draw and the computer select $computerGuess");
                        break;
            case "Peper":
                        print("You Win and the computer select $computerGuess");

                        playerScore++;
                        break;
            case "Scissors":
                        print("Computer Win and the computer select $computerGuess");
                        computerScore++;
                        break;
            default:
                        print("Invalid Input");
                        return;
                        break;

          }
         }
         if(computerGuess=="Peper"){
          switch(playerChoice){
            case "Rock":
                        print("Computer Win and the computer select $computerGuess");
                        computerScore++;
                        break;
            case "Peper":
                        print("Draw and the computer select $computerGuess");
                        break;
            case "Scissors":
                        print("You Win and the computer select $computerGuess");
                        playerScore++;
                        break;
            default:
                        print("Invalid Input");
                        return;
                        break;

          }
         }
         if(computerGuess=="Scissors"){
          switch(playerChoice){
            case "Rock":
                        print("You win and the computer select $computerGuess");
                        playerScore++;
                        break;
            case "Peper":
                        print("Coumpter Win and the computer select $computerGuess");
                        computerScore++;
                        break;
            case "Scissors":
                        print("Draw and the computer select $computerGuess");
                        playerScore++;
                        break;
            default:
                        print("Invalid Input");
                        return;
                        break;

          }
         }
  }

  if(playerScore>computerScore){
    print("You Win in this $rounds round you score is $playerScore and the computer score is $computerScore");
  }
  else if(playerScore<computerScore){
    print("You lose and computer win in this $rounds round you score is $playerScore and the computer score is $computerScore");
  }
  else{
    print("Draw in this $rounds you score is $playerScore round and the computer score is $computerScore");
  }
}