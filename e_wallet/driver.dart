import 'wallet.dart';
import 'dart:io';

var current_time = DateTime.now().hour;
bool is_busy = false;
// making this global to avoid complications

peak_hours() {
  if (current_time > 12 && current_time < 17) {
    is_busy = true;
    print("10% discount will be given due to off peak hours");
  }
  else {
    print("Not busy time");
  }
}

// ask user for wallet id, then show its monthly transactions
get_monthly_transactions(wallets) {
  stdout.write("Enter wallet Id: ");
  int index = input('int');
  if (wallets[index].monthly_transactions.isEmpty) {
    print("\nThere's no transaction to be displayed");
    return;
  }

  // [type, amount, total_after, time]
  print("\nBelow is you monthly transaction\n");
  print("----------------------------------------------------");
  print("Type\tamount\tr_bal\ttime");
  print("----------------------------------------------------");

  for (int i = 0; i < wallets[index].monthly_transactions.length; i++) {
    stdout.write(wallets[index].monthly_transactions[i]);
  }
  print("");
}

// withdraw money from the wallet
withdraw(wallets) {
  stdout.write("Enter your wallet Id: ");
  int index = input('int');
  stdout.write("How much you wanna withdraw: ");
  double amount = input('double');
  if (wallets[index].balance < amount) {
    print("The amount must be <= total balance");
    return;
  }
  is_busy ? amount -= (amount * .1) : {};
  wallets[index].balance -= amount;

  // we need this to save the transaction for future use
  wallets[index].monthly_transactions.addAll({
    // we need to make sure we reflect each transaction in the history book
    "w_draw" + "\t",
    amount.toString() + "\t",
    wallets[index].balance.toString() + "\t",
    DateTime.now().toString() + "\t",
    "\n",
  });
}

// from the function name --> topingup the wallet
top_up(wallets) {
  // enter amount
  // enter payment type
  stdout.write("Enter Wallet Id: ");
  int index = input('int');
  stdout.write("Enter payment type (CC for credit-card): ");
  String? payment_type = input('str').toLowerCase();
  stdout.write("Enter amount: ");
  double amount =
      input('double') ?? .0; //nullable check, if returns null set it to .0

  if (payment_type == "cc") {
    // the condition payment_type == cc ? amount += .5, this is from the requirements
    amount += .5;
  }
  is_busy ? amount += (amount * .1) : {};
  wallets[index].balance += amount;
  wallets[index].payment_type = payment_type;
  wallets[index].monthly_transactions.addAll({
    // we need to make sure we reflect each transaction in the history book
    "top_up" + "\t",
    amount.toString() + "\t",
    wallets[index].balance.toString() + "\t",
    DateTime.now().toString() + "\t",
    "\n",
  });
}

// we using dynamic type because we dont really what we returning exactly
dynamic input(type) {
  dynamic data;
  // proper input taking with error handling
  // try avoiding unecessary crash due to invalid input from user
  try {
    type == "int"
        ? {data = int.parse(stdin.readLineSync()!)}
        : type == "double"
            ? {data = double.parse(stdin.readLineSync()!)}
            : type == "str"
                ? {data = stdin.readLineSync()!}
                : {};
  } on Exception {
    stdout.write(
        "Error: Must be an invalid data type\nPlease Try again with valid input: ");
    data = input(type);
  }
  return data;
}


create_new_wallet(wallets) {
  stdout.write("Enter wallet balance: ");
  double balance = input('double');
  stdout.write("Enter payment type: ");
  String payment_type = input('str');
  double amount_remain = .0; // anything we create new wallet remain_amount = 0;
  int id = wallets.length; // giving wallet an id
  var new_wallet = Wallet(
    // the constructor we have in class wallet, initialize everything
    balance,
    payment_type,
    amount_remain,
    id,
  );
  wallets.add(
      new_wallet); // since wallets a list we can call the add function on it.
  print_wallet_info(new_wallet); 
}


print_wallet_info(wallet) {
  print("\n\nCongratulations!!!");
  print("You have succesfully created a new wallet at: ${wallet.created_at}");
  print("With the following info");
  print("Balance: ${wallet.balance}");
  print("Id: ${wallet.id}");
  print("Payment type: ${wallet.payment_type}");
}


get_balance(wallets) {
  stdout.write("Enter your wallet Id: ");
  int index = input('int');
  print("The wallet with id: ${index} balance is: ${wallets[index].balance}");
}
