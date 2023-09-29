import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_flutter_app/view_model/select_from_box/states.dart';

class SelectTybeCubit extends Cubit<SelectTybeStates> {
  SelectTybeCubit() : super(SelectTybeInitStates());
  String? selectedTybe;
  dynamic selectFromBox(String tybe) {
    selectedTybe = tybe;
    emit(SelectTybeSuccessState());
    return selectedTybe;
  }
}
