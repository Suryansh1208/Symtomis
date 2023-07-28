import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<Map<String, dynamic>> getData(String symp) async {
    // print(symp);
    Map<String, dynamic> m = {};
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('disease').get();
    // final allData1 = querySnapshot.docs.map((e) => e.get('symptoms')).toList();
    final allData2 = (querySnapshot.docs
        .map((e) => e.data() as Map<String, dynamic>)).toList();
    // print(allData2);
    // return allData2[4]['prevention'];
    for (var i = 0; i < allData2.length; i++) {
      // print(allData2[i]["name"]);
      // print('...');
      // print(symp);
      if (allData2[i]["name"] == symp) {
        m = allData2[i];
        break;
      }
    }
    // print('sssss');
    return m;
  }

  Future<List> getData2(String symp) async {
    // print(symp);
    List mylist = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('symptoms').get();
    // final allData1 = querySnapshot.docs.map((e) => e.get('symptoms')).toList();
    final allData2 = (querySnapshot.docs
        .map((e) => e.data() as Map<String, dynamic>)).toList();
    // print(allData2);
    // return allData2[4]['prevention'];
    for (var i = 0; i < allData2.length; i++) {
      // print(allData2[i]["name"]);
      // print('...');
      // print(symp);
      if (allData2[i]["name"] == symp) {
        mylist = allData2[i]["diseases"];
        break;
      }
    }
    // print('sssss');
    return mylist;
  }
}
