import 'package:blog/app/modules/auth/controllers/auth_controller.dart';
import 'package:blog/app/services/shared_preferences_service.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(() => SharedPreferencesService().init(),
        permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
