import 'dart:io';
import 'dart:math';

void main(){
  var random =Random();
  int playerGuess;
  int playerScore=0,hpScore=0;
  print("Welcome to the Dice game! ");
  var Rules={"Count-Max":6,"Count-Min":1 ,"Total-Player":2, "Total-Rounds":"Your Choice"};
  print("Press 1 if you want The rules and 0 if you want to quiet:");
  var Select=stdin.readLineSync();
  switch(Select){
    case '0':
          print("Game over You Lose");
          break;
    case '1':
          print(Rules);
          print("the game run after 10 sec You Have to be ready");
          print("Select the number of round");
          var r=stdin.readLineSync();
          int roundnb=int.parse(r ?? '0');
          print("Game Start");
          for( var i=0;i<roundnb;i++){
            int HpGuess=random.nextInt(6) +1;
            print("round $i Select a number between 1 and 6:");
            int? playerGuess=int.tryParse(stdin.readLineSync()!);
            print("hp select $HpGuess");
            if(playerGuess!=null && playerGuess>HpGuess){
              playerScore++;
              print("You win in $i Round");
            }
            else if(playerGuess!=null && playerGuess<HpGuess){
              hpScore++;
              print("hp Win in $i Round");
            }
            else{
              print("Draw in $i Round");
            }

          }
          if(playerScore>hpScore){
            print("You win with $playerScore");
          }
          else if(playerScore<hpScore){
            print("Hp win with $hpScore");
          }
          else{
            print("Draw");
          }

          break;
    default:
          print("Invalid Selection,please Try again");
          break;
          
  }
  
}