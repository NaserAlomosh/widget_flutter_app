import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_flutter_app/classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import 'package:widget_flutter_app/classes/firebase/add_name_library/add_name_library.dart';
import 'package:widget_flutter_app/classes/firebase/add_name_library/check_name_exists.dart';
import 'package:widget_flutter_app/classes/firebase/get_name_libraray/get_name_library.dart';
import 'package:widget_flutter_app/constant/string/admin_information.dart';
import 'package:widget_flutter_app/view_model/add_library_lib/states.dart';
import 'package:widget_flutter_app/view_model/add_name_library/states.dart';
import 'package:widget_flutter_app/view_model/get_name_library/cubit.dart';

class AddNameLibraryCubit extends Cubit<AddNameLibraryState> {
  AddNameLibraryCubit() : super(AddNameLibraryInitial());
  Future<void> addName(
      {String? type, String? confirmtype, String? adminPassword}) async {
    emit(AddNameLoadingState());

    if (isNotValue(type)) {
      emit(AddNameTypeErrorState());
    } else if (await checkNameExists(type!)) {
      emit(AddNameTybeIsExistsState());
    } else {
      if (type == confirmtype) {
        if (adminPassword == ADMINP_ASSWORD) {
          await addNameLibrary(type).then((value) async {
            await getLibraryName();
            emit(AddNameSucssesState());
          });
        } else {
          // admin password error
          emit(AddNameAdminPasswordErrorState());
        }
      } else {
        //confirmError
        emit(AddNameTypeConfirmErrorState());
      }
    }
  }
}
