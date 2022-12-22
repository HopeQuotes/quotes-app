import 'package:data/cache/database/core/app_database.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:domain/data_source/user_data_source.dart';
import 'package:domain/models/ui/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cache/database/dao/user_dao.dart';

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final UserDao _userDao;

  UserLocalDataSourceImpl({
    required UserDao userDao,
  }) : _userDao = userDao;

  @override
  Future<User?> getUser() async {
    var user = await _userDao.getUser();
    return user?.toUi();
  }

  @override
  Future<void> saveUser(User user) async {
    (await SharedPreferences.getInstance()).setString('token', user.authToken);
    await _userDao.insertUser(user);
  }
}
