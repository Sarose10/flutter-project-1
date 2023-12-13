import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vk/api_service/movie_service.dart';


final categoryProvider = FutureProvider((ref) => FoodService.getCategory());

final categoryItemProvider = FutureProvider.family(
        (ref, String category) {
          return FoodService.getFoodItem(category: category);
        });