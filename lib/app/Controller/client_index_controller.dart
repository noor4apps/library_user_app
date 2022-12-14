import 'package:get/get.dart';
import 'package:library_user_app/app/Repository/client_index_repo.dart';
import 'package:library_user_app/app/Response/book_index_response.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class ClientIndexController extends GetxController {
  final ClientIndexRepo clientIndexRepo;

  ClientIndexController({required this.clientIndexRepo});

  List<dynamic> _clientIndexList = [];

  bool _isLoading = false;

  List<dynamic> get clientIndexList => _clientIndexList;

  bool get isLoading => _isLoading;

  Future<void> getClientIndexList() async {
    Response response = await clientIndexRepo.getClientIndexResponse();
    if (response.statusCode == 200) {
      clientIndexList.clear();
      clientIndexList.addAll(BookIndexResponse.fromJson(response.body).bookList!);
      _isLoading = true;
      update();
    }
  }

  @override
  void onInit() {
    getClientIndexList();
    super.onInit();
  }
}
