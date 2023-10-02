import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addNameLibrary(
  String type,
) async {
  FirebaseFirestore.instance
      .collection('lib_name')
      .doc(type)
      .set({'type': type});
}
