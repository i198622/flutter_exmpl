import 'package:bloc/bloc.dart';

import '../repository/main_repository.dart';
import 'main_events.dart';
import 'main_state.dart';

class MainBloc extends Bloc<AuthEvent, MainState> {
  final MainRepositoryInterface repository;

  MainBloc({
    required this.repository,
  }) : super(MainState.initial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  _onLogin(event, emit) async {
    emit(
      state.copyWith(
        loading: ContentState.loading,
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        loading: ContentState.success,
        state: AuthenticationState.authenticated,
      ),
    );
  }

  _onLogout(event, emit) {
    emit(state.copyWith(state: AuthenticationState.unauthenticated));
  }
}
