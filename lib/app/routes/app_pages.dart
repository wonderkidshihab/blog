import 'package:blog/app/modules/blog_details/bindings/blog_details_binding.dart';
import 'package:blog/app/modules/blog_details/views/blog_details_view.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/create_blog/bindings/create_blog_binding.dart';
import '../modules/create_blog/views/create_blog_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: _Paths.AUTH,
          page: () => const AuthView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: _Paths.CREATE_BLOG,
          page: () => const CreateBlogView(),
          binding: CreateBlogBinding(),
        ),
        GetPage(
          name: _Paths.BLOG_DETAILS,
          page: () => const BlogDetailsView(),
          binding: BlogDetailsBinding(),
        ),
      ],
    ),
  ];
}
