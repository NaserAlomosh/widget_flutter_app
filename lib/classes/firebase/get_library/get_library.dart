import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:widget_flutter_app/model/library/library.dart';

Future<List<LibraryModel>> getWidget(
  String collection,
) async {
  List<LibraryModel> data = [];
  await FirebaseFirestore.instance.collection(collection).get().then((value) {
    for (var element in value.docs) {
      data.add(LibraryModel.fromJosn(element.data()));
    }
  }).catchError((onError) {
    log('Burgers DONT GET DATA');
  });
  return data;
}
