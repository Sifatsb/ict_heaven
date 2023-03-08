import 'package:get/get.dart';

class LoginController extends GetxController {
  var language  = false.obs;
  var press     = false.obs;
  var editable  = false.obs;

  var id      = 0.obs;
  var name    = ''.obs;
  var phone   = ''.obs;
  var email   = ''.obs;
  var photo   = ''.obs;
  var token   = ''.obs;
}
