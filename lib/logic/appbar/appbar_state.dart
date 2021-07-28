part of 'appbar_cubit.dart';

class AppBarState extends Equatable {
  final String title;

  AppBarState({
    required this.title,
  });

  @override
  List<Object?> get props => [title];
}
