class OwnerModel {
  final String? busNo;
  final String? route;
  final String? income;

  const OwnerModel( {
    this.busNo, this.route, this.income,
  });

  Map<String, dynamic> toJason() =>
      {
        "BusNo": busNo,
        "Route": route,
        "Income": income,
      };

  factory OwnerModel.fromMap(json){
    return OwnerModel(
      busNo: json['BusNo'],
      route: json['Route'],
      income: json['Income'],
    );
  }
}

class BankDetailsModel{
  final String? accNo;
  final String? bank;
  final String? branch;

  const BankDetailsModel( {
    this.accNo, this.bank, this.branch,
  });

  Map<String, dynamic> toJason() =>
      {
        "AccNo": accNo,
        "Bank": bank,
        "Branch": branch,
      };
  factory BankDetailsModel.fromMap(json){
    return BankDetailsModel(
      accNo: json['AccNo'],
      bank: json['Bank'],
      branch: json['Branch'],
    );
  }
}