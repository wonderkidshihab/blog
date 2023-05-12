import 'package:blog/app/modules/auth/controllers/auth_controller.dart';
import 'package:blog/app/services/shared_preferences_service.dart';
import 'package:blog/app/utils/api_client.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(() => SharedPreferencesService().init(),
        permanent: true);
    await ApiClient.init();
    Get.put(AuthController(), permanent: true);
  }
}
