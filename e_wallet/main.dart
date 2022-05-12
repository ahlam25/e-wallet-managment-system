import 'dart:io';
import 'wallet.dart';
import 'driver.dart';

void main() {
  List<Wallet> wallets = []; //To store wallets inserted

  while (true) {
    //Let user choose
    peak_hours(); // this function help us to determine if its peak hours or not
    print("\nE-wallet Management system\n");
    print("1. Create new wallet");
    print("2. Check wallet balance"); //print product list with the detail
    print("3. Topup wallet");
    print("4. Withdraw from wallet");
    print("5. Print Monthly Financial Transactions");
    stdout.write("Enter your choice: ");
    // rule 1. never trust the user we implementing some error handling
    // we gonna be using try and catch to ensure that everything goes the way we wanted it
    // basically try taking the input, if the user didnt enter what we expected, instead of crashing the program,
    // we handle the errors and ask the user to reneter again
    try {
      int user_input = input('int');

      if (user_input > 5 || user_input < 0) {
        print("ERROR: Pls select a number a number between 1 - 3");
        continue;
      }
      // literally if statements
      switch (user_input) {
        case 1:
          create_new_wallet(wallets);
          break;
        case 2:
          get_balance(wallets);
          break;
        case 3:
          top_up(wallets);
          break;
        case 4:
          withdraw(wallets);
          break;
        case 5:
          get_monthly_transactions(wallets);
          break;
      }
    } on FormatException {
      print("ERROR: Pls an interger number");
    }
  }
}
