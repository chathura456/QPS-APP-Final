class ConductorModel {
  final String? payment;
  final String? amount;
  final String? date;
  final String? description;

  const ConductorModel({
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

  factory ConductorModel.fromMap(json){
    return ConductorModel(
      payment: json['Payment'],
      amount: json['Amount'],
      date: json['Date'],
      description: json['Description'],
    );
  }
}

class CurrentBus{
  final String? busNo;
  final String? owner;
  final String? duration;

  const CurrentBus({
    this.busNo, this.owner, this.duration,
  });

  Map<String, dynamic> toJason() =>
      {
        "BusNO": busNo,
        "Owner": owner,
        "Duration": duration,
      };
  factory CurrentBus.fromMap(json){
    return CurrentBus(
      busNo: json['BusNO'],
      owner: json['Owner'],
      duration: json['Duration'],
    );
  }
}