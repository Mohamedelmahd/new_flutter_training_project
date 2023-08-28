import 'package:flutter/material.dart';
import 'package:new_flutter_training_project/models/user_model.dart';
import 'package:new_flutter_training_project/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial()) {
    getMyUsers();
  }

  List<UserModel> users = [];
  getMyUsers() async {
    try {
      emit(UsersLoading());
      users = await UserService().getUsers();
      emit(UsersSuccess());
    } catch (e) {
      emit(UsersError());
    }
  }
}

class UserService {
}

class UsersSuccess {
}

class UsersError {
}

class UserModel {
  static UserModel fromJson(element) {}
}

class UsersInitial {
}

class UsersState {
}
