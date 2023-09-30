import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> getLibraryName() async {
  List<String> libraryName = [];
  await FirebaseFirestore.instance.collection('lib_name').get().then((value) {
    for (var element in value.docs) {
      libraryName.add(element.id);
    }
  });
  return libraryName;
}
