
class Wallet {


  late int id;
  late double balance; // the wallet balance
  late String payment_type; // payment type cc -> credit card
  late DateTime created_at; // time we created the wallet
  late double amount_remain; // technically this reflect balance
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
