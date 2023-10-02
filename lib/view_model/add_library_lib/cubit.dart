import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_flutter_app/classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import 'package:widget_flutter_app/classes/firebase/add_library/add_library.dart';
import 'package:widget_flutter_app/view_model/add_library_lib/states.dart';

class AddNewLibCubit extends Cubit<AddNewLibState> {
  AddNewLibCubit() : super(AddNewLibInitial());
  void addNewLib({
    required String? name,
    required String? image,
    required String? gitHubUrl,
    required String? pubDevUrl,
    required String? type,
  }) async {
    if (isNotValue(name)) {
      emit(AddNameErrorState());
    } else if (isNotValue(image)) {
      emit(AddImageErrorState());
    } else if (isNotValue(gitHubUrl)) {
      emit(AddgitHubUrlErrorState());
    } else if (isNotValue(pubDevUrl)) {
      emit(AddpubDevUrlErrorState());
    } else if (isNotValue(type)) {
      emit(AddTypeErrorState());
    } else {
      emit(AddNewLoadingState());
      await addLibrary(
        name: name,
        image: image,
        gitHubUrl: gitHubUrl,
        pubDevUrl: pubDevUrl,
        type: type,
      ).then((_) {
        emit(AddNewSucssesState());
      });
    }
  }
}
