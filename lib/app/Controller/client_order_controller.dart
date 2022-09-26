import 'package:get/get.dart';
import 'package:library_user_app/app/Model/order_model.dart';
import 'package:library_user_app/app/Repository/client_order_repo.dart';
import 'package:library_user_app/helper/route_helper.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ClientOrderController extends GetxController implements GetxService {
  final ClientOrderRepo clientOrderRepo;

  ClientOrderController({required this.clientOrderRepo});

  List<OrderModel> clientOrderList = [];

  bool isLoading = false;

  bool isSend = true;

  Future<void> getClientOrderList() async {
    Response response = await clientOrderRepo.getClientOrderResponse();
    if(response.statusCode == 200) {
      clientOrderList.clear();
      clientOrderList.addAll(Order.fromJson(response.body).orderList!);
      isLoading = true;
      update();
    } else if (response.isOk == false) {
      showCustomSnackBar(message: 'Server not found');
      print('Server not found');
    } else if (response.statusCode == 500) {
      print('500 Internal Server Error');
    } else {
      showCustomSnackBar(message: '${Order.fromJson(response.body).message}');
    }

  }

  Future<void> addOrder(int bookId) async {
    if(isSend) {

      isSend = false;
      Response response = await clientOrderRepo.addOrderResponse(bookId);
      if (response.statusCode == 200) {
        showCustomSnackBar(title: 'Status', message: '${response.body['message']}', isError: false);
      } else if (response.statusCode == 500) {
        print('500 Internal Server Error');
      } else {
        showCustomSnackBar(message: '${response.body['message']}');
      }
      isSend = true;

    }
  }

  launchURL({required String url}) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> destroyOrder(int bookId) async {
    if(isSend) {
      isSend = false;
      Response response = await clientOrderRepo.destroyOrderResponse(bookId);
      if (response.statusCode == 200) {
        showCustomSnackBar(title: 'Status', message: '${response.body['message']}', isError: false);
      } else if (response.statusCode == 500) {
        print('500 Internal Server Error');
      } else {
        showCustomSnackBar(message: '${response.body['message']}');
      }
      isSend = true;
      getClientOrderList();
      update();
    }
  }

}
