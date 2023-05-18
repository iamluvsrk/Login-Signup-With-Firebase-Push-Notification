import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_demo/constants/enum.dart';
import 'package:login_demo/domain/repository/auth_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

/// A [HomeBloc] that manages 'Home Screen' as its state
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthRepository authRepository;
  HomeBloc(this.authRepository) : super(HomeState.initial()) {
    on<Logout>(_logout);
  }
  _logout(Logout event, Emitter<HomeState> emit) async {
    emit(state.copyWith(pageStatus: PageStatus.loading));
    final res = await authRepository.logoutUser();
    if (res.isLeft()) {
      emit(state.copyWith(pageStatus: PageStatus.failure));
    } else {
      emit(state.copyWith(pageStatus: PageStatus.success));
    }
  }
}
