import 'package:blog/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with StateMixin<String> {
  @override
  void onInit() {
    super.onInit();
    change('Splash Screen', status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }
}
