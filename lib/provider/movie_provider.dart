import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vk/api_service/movie_service.dart';




final movieProvider = FutureProvider((ref) => MovieService.getMovie());