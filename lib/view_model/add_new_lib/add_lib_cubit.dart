import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_lib_state.dart';

class AddNewLibCubit extends Cubit<AddNewLibState> {
  AddNewLibCubit() : super(AddNewLibInitial());

  addNewTybeLib({
    required String? name,
    required String? image,
    required String? gitHubUrl,
    required String? pubDevUrl,
    required String? type,
  }) async {
    String? id;
    if (cheakNullValue([name, image, gitHubUrl, pubDevUrl, type])) {
      emit(AddNewLoadingState());
      //
      await FirebaseFirestore.instance
          .collection(type!)
          .add({}).then((DocumentReference doc) async {
        id = doc.id;
        FirebaseFirestore.instance.collection(type).doc(doc.id).set({
          'name': name,
          'image': image,
          'gitHubUrl': gitHubUrl,
          'pubDevUrl': pubDevUrl,
          'type': type,
          'id': id,
        }).then((_) {
          FirebaseFirestore.instance.collection('lib_name').doc(type).set({
            'type': type,
          }).then((_) {
            //
            emit(AddNewSucssesState());
          });
        });
      });
    } else {
      //
      emit(AddNewErrorState());
    }
  }

  bool cheakNullValue(List<dynamic> value) {
    bool cheak = true;
    for (var element in value) {
      if (element == null) {
        cheak = false;
        return cheak;
      }
    }
    return cheak;
  }
}
