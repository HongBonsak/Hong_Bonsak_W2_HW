class BankException implements Exception {
  final String message;
  BankException(this.message);

  @override
  String toString() => message;
}

class BankAccount {
  final int _id;
  final String _owner;
  double _balance;

  BankAccount(this._id, this._owner) : _balance = 0;

  int get id => _id;
  String get owner => _owner;
  double get balance => _balance;

  void credit(double amount) {
    if (amount <= 0) {
      throw BankException('Credit amount must be positive!');
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw BankException('Withdrawal amount must be positive!');
    }
    if (_balance - amount < 0) {
      throw BankException('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    final exists = _accounts.any((account) => account.id == accountId);
    if (exists) {
      throw BankException('Account with ID $accountId already exists!');
    }
    final account = BankAccount(accountId, accountOwner);
    _accounts.add(account);
    return account;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance);
  ronanAccount.credit(100);
  print(ronanAccount.balance);
  ronanAccount.withdraw(50);
  print(ronanAccount.balance);

  try {
    ronanAccount.withdraw(75); 
  } catch (e) {
    print(e); 
  }

  try {
    myBank.createAccount(100, 'Honlgy'); 
  } catch (e) {
    print(e); 
  }
}
