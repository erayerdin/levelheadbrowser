import 'package:bloc/bloc.dart';
import 'package:is_first_run/is_first_run.dart';

class FirstRunCubit extends Cubit<bool> {
  FirstRunCubit() : super(true);

  void checkIfFirstRun() async {
    if (await IsFirstRun.isFirstRun()) {
      emit(true);
    } else {
      emit(false);
    }
  }
}
