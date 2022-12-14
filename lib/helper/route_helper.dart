import 'package:get/get.dart';
import 'package:library_user_app/view/page/book_page.dart';
import 'package:library_user_app/view/page/paginate_page.dart';
import 'package:library_user_app/view/page/home_page.dart';
import 'package:library_user_app/view/page/login_page.dart';
import 'package:library_user_app/view/page/orders_page.dart';
import 'package:library_user_app/view/page/register_page.dart';

class RouteHelper {

  static const String initial = '/';
  static const String paginate = '/paginate';
  static const String book = '/book';
  static const String register = '/register';
  static const String login = '/login';
  static const String myOrder = '/my-order';

  static String getInitial() => initial;
  static String getPaginate() => paginate;
  static String getBook(int pageId) => '$book?pageId=$pageId';
  static String getRegister() => register;
  static String getLogin() => login;
  static String getMyOrder() => myOrder;

  static List<GetPage> routes = [
    // HomePage
    GetPage(name: initial, transition: Transition.fadeIn, page: () => HomePage()),
    // PaginatePage
    GetPage(name: paginate, transition: Transition.fadeIn, page: () => PaginatePage()),
    // BookPage
    GetPage(name: book, transition: Transition.fadeIn, page: () => BookPage(pageId: int.parse(Get.parameters['pageId']!))),
    // RegisterPage
    GetPage(name: register, transition: Transition.fadeIn, page: () => RegisterPage()),
    // LoginPage
    GetPage(name: login, transition: Transition.fadeIn, page: () => LoginPage()),
    // OrdersPage
    GetPage(name: myOrder, transition: Transition.fadeIn, page: () => OrdersPage()),
  ];
}
