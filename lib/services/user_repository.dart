import 'package:flutter_bloc_network_example/models/user.dart';
import 'package:flutter_bloc_network_example/services/user_api_provider.dart';

class UsersRepository {
  UsersProvider _usersProvider = UsersProvider();

  Future<List<User>>getAllUsers() => _usersProvider.getUser();
}
