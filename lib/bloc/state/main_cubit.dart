import 'package:bloc/bloc.dart';

import '../repository/main_repository.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepositoryInterface repository;

  MainCubit({
    required this.repository,
  }) : super(MainState.initial());

  sendRequest() async {
    emit(
      state.copyWith(
        loading: ContentState.loading,
      ),
    );

    final result = await repository.getData();

    emit(
      state.copyWith(
        loading: ContentState.success,
        result: result,
      ),
    );
  }
}
