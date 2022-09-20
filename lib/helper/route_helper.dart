import 'package:get/get.dart';
import 'package:library_user_app/view/page/book_page.dart';
import 'package:library_user_app/view/page/grid_page.dart';
import 'package:library_user_app/view/page/home_page.dart';

class RouteHelper {

  static const String initial = '/';
  static const String grid = '/grid';
  static const String book = '/book';

  static String getInitial() => initial;
  static String getGrid() => grid;
  static String getBook(int pageId) => '$book?pageId=$pageId';

  static List<GetPage> routes = [
    // HomePage
    GetPage(name: initial, transition: Transition.fadeIn, page: () => HomePage()),
    // GridPage
    GetPage(name: grid, transition: Transition.fadeIn, page: () => GridPage()),
    // BookPage
    GetPage(name: book, transition: Transition.fadeIn, page: () => BookPage(pageId: int.parse(Get.parameters['pageId']!))),
  ];
}
