import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_flutter_app/classes/firebase/get_name_libraray/get_name_library.dart';
import 'package:widget_flutter_app/model/name_library/name_library.dart';
import 'package:widget_flutter_app/view_model/get_name_library/states.dart';

class GetNameLibraryCubit extends Cubit<GetNameLibraryState> {
  GetNameLibraryCubit() : super(GetNameLibraryInitial());
  List<NameLibraryModel> nameLibrarys = [];

  getName() async {
    emit(GetNameLibraryLoadingState());
    nameLibrarys = await getLibraryName();
    emit(GetNameLibrarySucssesState());
  }
}
