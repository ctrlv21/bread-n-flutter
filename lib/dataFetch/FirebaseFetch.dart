import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fnb/Model/offerDataModel.dart';

class FirebaseFetch{
  final databaseReference = FirebaseDatabase.instance.reference();
  List<OfferDataModel> data = [];
  Future getUserDetails(String bankName) async {
    User? mFirebaseUser = FirebaseAuth.instance.currentUser;
    var result = (await databaseReference.child("Bank").child("Axis").once()).value;
    for(var search in result){
      OfferDataModel user = new OfferDataModel();
      user.bankName = search["Bank Name"];
      user.cardType = search["card Type"];
      user.details = search["Details"];
      user.dueDate = search["Due Date"];
      user.url = search["Link"];
      data.add(user);
    }
    print(data.toString());
    return data;
    // if(result==null){
    //   return new UserModel();
    // }
    // else{
    //   UserModel user = new UserModel();
    //   user.phone = result['phone'];
    //   user.points = result['points'];
    //   user.sap = result['SAP'];
    //   user.name = result['name'];
    //   user.email = result['email'];
    //   return user;
    // }
  }
}