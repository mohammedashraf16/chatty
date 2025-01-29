import 'package:chatty/features/auth/data/model/my_user.dart';

abstract class SignInNavigator{
  void showLoading();
  void hideLoading();
  void showMessage(String message);
  void navigateToHome(MyUser user);
}