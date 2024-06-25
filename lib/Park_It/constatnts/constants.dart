import '../components/components.dart';
import '../layout/login/login_screen.dart';
import '../network/local/cache_helper.dart';

const LOGIN = 'login';
String uId = '';
const HOME = 'home';
const REGISTER = 'register';
void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value){
    if(value){
      navigateAndFinish(context, const Login());
    }
  });
}

