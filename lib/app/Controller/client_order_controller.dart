import 'package:get/get.dart';
import 'package:library_user_app/app/Model/order_model.dart';
import 'package:library_user_app/app/Repository/client_order_repo.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class ClientOrderController extends GetxController implements GetxService {
  final ClientOrderRepo clientOrderRepo;

  ClientOrderController({required this.clientOrderRepo});

  List<OrderModel> clientOrderList = [];

  bool isLoading = false;

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
}
