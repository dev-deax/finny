import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/domain/services/favorites_service.dart';
import 'package:finny/features/courses/infrastructure/datasources/local_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesNotifierProvider = StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  final favoritesService = FavoritesServiceImpl(LocalStorageDataSourceImpl());
  return FavoritesNotifier(favoritesService);
});

final favoriteCoursesProvider = Provider<AsyncValue<List<Course>>>((ref) {
  final favoritesState = ref.watch(favoritesNotifierProvider);
  return favoritesState.favoriteCourses;
});

final isFavoriteProvider = Provider.family<bool, String>((ref, courseId) {
  final favoritesState = ref.watch(favoritesNotifierProvider);
  return favoritesState.favoriteIds.contains(courseId);
});

class FavoritesState {
  final AsyncValue<List<Course>> favoriteCourses;
  final Set<String> favoriteIds;
  final bool isLoading;

  const FavoritesState({
    required this.favoriteCourses,
    required this.favoriteIds,
    this.isLoading = false,
  });

  FavoritesState copyWith({
    AsyncValue<List<Course>>? favoriteCourses,
    Set<String>? favoriteIds,
    bool? isLoading,
  }) {
    return FavoritesState(
      favoriteCourses: favoriteCourses ?? this.favoriteCourses,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final FavoritesService _favoritesService;

  FavoritesNotifier(this._favoritesService)
      : super(const FavoritesState(
          favoriteCourses: AsyncValue.loading(),
          favoriteIds: {},
        )) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      state = state.copyWith(isLoading: true);
      final favorites = await _favoritesService.getFavoriteCourses();
      final favoriteIds = favorites.map((course) => course.uid).toSet();

      state = FavoritesState(
        favoriteCourses: AsyncValue.data(favorites),
        favoriteIds: favoriteIds,
        isLoading: false,
      );
    } catch (error, stackTrace) {
      state = FavoritesState(
        favoriteCourses: AsyncValue.error(error, stackTrace),
        favoriteIds: state.favoriteIds,
        isLoading: false,
      );
    }
  }

  Future<void> addToFavorites(Course course) async {
    try {
      await _favoritesService.addToFavorites(course);

      final newFavoriteIds = Set<String>.from(state.favoriteIds)..add(course.uid);
      final currentFavorites = state.favoriteCourses.valueOrNull ?? <Course>[];
      final updatedFavorites = [...currentFavorites, course.copyWith(isFavorite: true)];

      state = state.copyWith(
        favoriteCourses: AsyncValue.data(updatedFavorites),
        favoriteIds: newFavoriteIds,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        favoriteCourses: AsyncValue.error(error, stackTrace),
      );
    }
  }

  Future<void> removeFromFavorites(String courseId) async {
    try {
      await _favoritesService.removeFromFavorites(courseId);

      // Actualizar el estado local sin recargar toda la lista
      final newFavoriteIds = Set<String>.from(state.favoriteIds)..remove(courseId);
      final currentFavorites = state.favoriteCourses.valueOrNull ?? <Course>[];
      final updatedFavorites = currentFavorites.where((course) => course.uid != courseId).toList();

      state = state.copyWith(
        favoriteCourses: AsyncValue.data(updatedFavorites),
        favoriteIds: newFavoriteIds,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        favoriteCourses: AsyncValue.error(error, stackTrace),
      );
    }
  }

  Future<void> toggleFavorite(Course course) async {
    if (state.favoriteIds.contains(course.uid)) {
      await removeFromFavorites(course.uid);
    } else {
      await addToFavorites(course);
    }
  }

  Future<void> clearFavorites() async {
    try {
      await _favoritesService.clearFavorites();
      state = const FavoritesState(
        favoriteCourses: AsyncValue.data([]),
        favoriteIds: {},
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        favoriteCourses: AsyncValue.error(error, stackTrace),
      );
    }
  }

  bool isFavorite(String courseId) {
    return state.favoriteIds.contains(courseId);
  }
}
