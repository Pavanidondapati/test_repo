import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posapp/model/user_model.dart';
import 'package:posapp/service/dashboard.services.dart';

final UserDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
