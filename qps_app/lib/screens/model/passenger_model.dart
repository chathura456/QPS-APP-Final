class PassengerModel {
  final String? payment;
  final String? amount;
  final String? date;
  final String? description;

  const PassengerModel({
    this.payment,
    this.amount,
    this.date,
    this.description,
  });

  Map<String, dynamic> toJason() =>
      {
        "Payment": payment,
        "Amount": amount,
        "Date": date,
        "Description": description,
      };

  factory PassengerModel.fromMap(json){
    return PassengerModel(
      payment: json['Payment'],
      amount: json['Amount'],
      date: json['Date'],
      description: json['Description'],
    );
  }
}