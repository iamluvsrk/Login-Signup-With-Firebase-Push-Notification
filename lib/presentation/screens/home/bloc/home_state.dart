part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.pageStatus,
  });

  final PageStatus? pageStatus;

  static initial() {
    return const HomeState(pageStatus: PageStatus.init);
  }

  @override
  List<Object?> get props => [
        pageStatus,
      ];

  HomeState copyWith({
    PageStatus? pageStatus,
  }) {
    return HomeState(
      pageStatus: pageStatus ?? this.pageStatus,
    );
  }
}
