import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:widget_flutter_app/classes/firebase/add_name_library/check_name_exists.dart';

Future<bool> addNameLibrary(
  String type,
) async {
  if (await checkNameExists(type)) {
    await FirebaseFirestore.instance
        .collection('lib_name')
        .doc(type)
        .set({'type': type}).then((value) {
      return true;
    });
  }
  return false;
}
