import '../../models/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();

  saveUser(User user);

  getUserById(int id);

  getUserByEmail(String email);
}
