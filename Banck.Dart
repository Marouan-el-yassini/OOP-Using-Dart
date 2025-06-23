import 'dart:io';
import 'package:uuid/uuid.dart';


class BankAccount {
  String id;
  int accountNumber;
  double balence;

  BankAccount({required this.id,required this.accountNumber,required this.balence});

  void displayAccount(){
    if(balence==0.0){ 
      print("You solde is over");
    }
    else{
      print("$id---$accountNumber:$balence");
    }
  }
}

class Diposit extends  BankAccount{
  double dipositBalence;

  Diposit({required String id,required int accountNumber,required double balence,required this.dipositBalence}) :super(id:id,accountNumber:accountNumber,balence:balence);

@override
  void displayAccount() {
    if(dipositBalence <= 0.0){
      print("Impossible to diposit this amount");
      return;
    }
    super.displayAccount();
    print("You diposit is $dipositBalence");
    balence += dipositBalence;
    print("you new balence is $balence");
  }
}
class Withdraw extends BankAccount{
  double withdrawBalence;

  Withdraw({required String id,required int accountNumber,required double balence,required this.withdrawBalence}) :super(id:id,accountNumber:accountNumber,balence:balence);
  @override
  void displayAccount(){
    if(withdrawBalence> balence){
      print("Impossible to withdraw this amount");
      return;
    }
    super.displayAccount();
    balence -=withdrawBalence;
    print("your new balence is $balence");
  }
}

void main(){
  var uuid =Uuid();
  String idguide = uuid.v4();
  print("enter your account number and your balence:");
  int? acnumb=int.tryParse(stdin.readLineSync() ?? '');
  double? bal = double.tryParse(stdin.readLineSync() ?? '');
  BankAccount a =BankAccount(id: idguide,accountNumber: acnumb!, balence:bal!);
  a.displayAccount();
  print("do you want to diposit or withdraw? ");
  String? choice = stdin.readLineSync();
  switch (choice) {
    case "diposit":
      print("Enter the amount you want to diposit:");
      double? dipBal = double.tryParse(stdin.readLineSync() ?? '');
      Diposit d = Diposit(id: idguide, accountNumber: acnumb, balence: bal, dipositBalence: dipBal!);
      d.displayAccount();
      break;
    case "withdraw":
      print("Enter the amount you want to withdraw:");
      double? withBal = double.tryParse(stdin.readLineSync() ?? '');
      Withdraw w = Withdraw(id: idguide, accountNumber: acnumb, balence: bal, withdrawBalence: withBal!);
      w.displayAccount();
      break;
    default:
      print("Invalid choice");
  }

  

}