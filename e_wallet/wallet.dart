
class Wallet {
  //late keyword is to tell the compiler to treat this variable as non-nullable and will be initialized later

  late int id;
  late double balance; // the wallet balance
  late String payment_type; // payment type cc -> credit card
  late DateTime created_at; // time we created the wallet
  late double amount_remain; // technically this reflect balance
  // an empty string list to add transaction history, (Kinda smart way of not implementing alot of things)
  final monthly_transactions = <String>[];

  Wallet(balance, payment_type, amount_remain, id) {
    // constructor]
    this.id = id;
    this.balance = balance;
    this.payment_type = payment_type;
    this.created_at = DateTime.now();
    this.amount_remain = amount_remain;
  }
}
