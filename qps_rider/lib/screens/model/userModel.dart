import 'package:qps_rider/screens/screens.dart';
class UserModel {
  String? uid;
  String? email;
  String? phone;
  String? type;
  String? name;
  String? points;
  ConductorModel? conductorModel;
  OwnerModel? ownerModel;
  SellerModel? sellerModel;

  UserModel(
      {this.uid, this.email, this.phone, this.type, this.name, this.points,
      this.sellerModel,
        this.ownerModel,
        this.conductorModel
      });

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['Email'],
      uid: map['UserID'],
      phone: map['Phone'],
      type: map['Type'],
      name: map['UserName'],
      points: map['Points'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'UserID': uid,
      'Email': email,
      'Phone': phone,
      'Type': type,
      'UserName': name,
      'Points': points,
    };
  }
  Map<String,dynamic>updateIdJason()=>{
    "UserID":uid,
  };
  Map<String,dynamic>updateAccTypeJason()=>{
    "Type":type,
  };
}
