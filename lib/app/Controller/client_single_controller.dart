import 'package:get/get.dart';
import 'package:library_user_app/app/Model/book_single_model.dart';
import 'package:library_user_app/app/Repository/client_single_repo.dart';
import 'package:library_user_app/app/Response/book_single_response.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class ClientSingleController extends GetxController implements GetxService {
  final ClientSingleRepo clientSingleRepo;

  ClientSingleController({required this.clientSingleRepo});

  late BookSingleModel _singleBook;

  bool _isLoading = false;

  BookSingleModel get singleBook => _singleBook;

  bool get isLoading => _isLoading;

  Future<void> getClientSingleBook(int bookId) async {
    Response response = await clientSingleRepo.getClientSingleResponse(bookId);
    if (response.statusCode == 200) {
      _singleBook = BookSingleResponse.fromJson(response.body).bookSingle!;
      _isLoading = true;
      update();
    }
  }
}
