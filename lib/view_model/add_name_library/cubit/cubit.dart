import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_flutter_app/classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import 'package:widget_flutter_app/classes/firebase/add_name_library/add_name_library.dart';
import 'package:widget_flutter_app/classes/firebase/add_name_library/check_name_exists.dart';
import 'package:widget_flutter_app/view_model/add_name_library/cubit/states.dart';

class AddNameLibraryCubit extends Cubit<AddNameLibraryState> {
  AddNameLibraryCubit() : super(AddNameLibraryInitial());
  addName({String? tybe}) async {
    if (isNotNullValue(tybe)) {
      emit(AddNameTypeErrorState());
    } else if (await checkNameExists(tybe!)) {
      emit(AddNameTybeIsExistsState());
    } else {
      emit(AddNameLoadingState());
      await addNameLibrary(tybe).then((value) {
        emit(AddNameSucssesState());
      }).catchError((onError) {
        emit(AddNameErrorState());
      });
    }
  }
}
