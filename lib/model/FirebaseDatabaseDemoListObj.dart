// To parse this JSON data, do
//
//     final firebaseDatabaseDemoListObj = firebaseDatabaseDemoListObjFromJson(jsonString);

import 'dart:convert';

FirebaseDatabaseDemoListObj firebaseDatabaseDemoListObjFromJson(String str) => FirebaseDatabaseDemoListObj.fromJson(json.decode(str));

String firebaseDatabaseDemoListObjToJson(FirebaseDatabaseDemoListObj data) => json.encode(data.toJson());

class FirebaseDatabaseDemoListObj {
  FirebaseDatabaseDemoListObj({
    this.fname,
    this.lname,
    this.email,

  });

  String? fname;
  String? lname;
  String? email;

  factory FirebaseDatabaseDemoListObj.fromJson(Map<String, dynamic> json) => FirebaseDatabaseDemoListObj(
    fname: json["fname"],
    lname: json["lname"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "lname": lname,
    "email": email,
  };
}
