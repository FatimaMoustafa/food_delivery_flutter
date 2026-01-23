import 'package:ecommerce_app_food_delivery/features/cart_page/cart_screen.dart';
import 'package:ecommerce_app_food_delivery/features/food_page/food_details_screen.dart';
import 'package:ecommerce_app_food_delivery/features/home_page/home_page_screen.dart';
import 'package:ecommerce_app_food_delivery/models/popular_products_model.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../features/recommended_food_page/recommended_food_details_screen.dart';
import 'app_routes.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homePageScreen,
      routes: [
        GoRoute(
          path: AppRoutes.homePageScreen,
          name: AppRoutes.homePageScreen,
          builder: (context, state) => const HomePageScreen()
        ),
        GoRoute(
            path: AppRoutes.foodDetailsScreen,
            name: AppRoutes.foodDetailsScreen,
            // builder: (context, state) => const FoodDetailsScreen()
          builder: (context, state) {
              final product = state.extra as ProductModel;
              return FoodDetailsScreen(product);
          }
        ),
        GoRoute(
            path: AppRoutes.recommendedFoodDetailsScreen,
            name: AppRoutes.recommendedFoodDetailsScreen,
            builder: (context, state) {
              final extra = state.extra as List<dynamic>;
              final RecommendedProductController controller = extra[0];
              final int index = extra[1];
              // final RecommendedProductController controller = state.extra as RecommendedProductController;

              return RecommendedFoodDetailsScreen(
                controller,
                index
              );
              // final product = state.extra as RecommendedProductController;
              // return RecommendedFoodDetailsScreen(product);
            }
        ),
        GoRoute(
            path: AppRoutes.cartScreen,
            name: AppRoutes.cartScreen,
            builder: (context, state) => const CartScreen()
        ),
        // GoRoute(
        //     path: AppRoutes.createNewPasswordScreen,
        //     name: AppRoutes.createNewPasswordScreen,
        //     builder: (context, state) => const CreateNewPasswordScreen()
        // ),
        // GoRoute(
        //     path: AppRoutes.passwordChangedScreen,
        //     name: AppRoutes.passwordChangedScreen,
        //     builder: (context, state) => const PasswordChangedScreen()
        // ),
        // GoRoute(
        //     path: AppRoutes.verifyOtpScreen,
        //     name: AppRoutes.verifyOtpScreen,
        //     builder: (context, state) => const VerifyOtpScreen()
        // ),
        // GoRoute(
        //     path: AppRoutes.mainScreen,
        //     name: AppRoutes.mainScreen,
        //     builder: (context, state) => const MainScreen()
        // ),
      ]
  );
}