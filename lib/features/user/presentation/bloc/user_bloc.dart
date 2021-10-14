import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:k_taxi/features/user/domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required this.userRepository,
  }) : super(UserInitial());

  final UserRepository userRepository;

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserPosition) {
      final either = await userRepository.getUserPosition();
      either.fold((l) => print('l => $l'), (r) => print('r => ${r.position}'));
    }
  }
}
