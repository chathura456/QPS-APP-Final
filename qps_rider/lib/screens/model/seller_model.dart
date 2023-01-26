class SellerModel {
  final String? package;
  final String? type;
  final String? duration;

  const SellerModel( {
    this.package, this.type, this.duration,
  });

  Map<String, dynamic> toJason() =>
      {
        "Package": package,
        "Type": type,
        "Duration": duration,
      };

  factory SellerModel.fromMap(json){
    return SellerModel(
      package: json['Package'],
      type: json['Type'],
      duration: json['Duration'],
    );
  }
}

class MyAdsModel{
  final String? adID;
  final String? views;
  final String? rating;

  const MyAdsModel(  {
    this.adID, this.views, this.rating,
  });

  Map<String, dynamic> toJason() =>
      {
        "AdID": adID,
        "Views": views,
        "Rating": rating,
      };
  factory MyAdsModel.fromMap(json){
    return MyAdsModel(
      adID: json['AdID'],
      views: json['Views'],
      rating: json['Rating'],
    );
  }
}