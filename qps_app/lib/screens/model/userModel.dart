import 'package:qps_app/screens/model/passenger_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? user1;

class UserModel {
  String? uid;
  String? email;
  String? phone;
  String? type;
  String? name;
  String? points;
  PassengerModel? passenger;

  UserModel(
      {this.uid, this.email, this.phone, this.type, this.name, this.points,this.passenger});

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

  void updateUserData({String? uid,
  String? email,
  String? phone,
  String? type,
  String? name,
  String? points,
  PassengerModel? passenger}) {
    this.uid = uid;
    this.passenger = passenger;
    this.points = points;
    this.type = type;
    this.phone = phone;
    this.name = name;
    this.email = email;
  }
}