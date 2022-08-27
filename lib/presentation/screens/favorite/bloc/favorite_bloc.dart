
import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/favorite_model.dart';
import 'package:meta/meta.dart';

import '../../../../data/repositories/favorite_repository.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteBloc({required this.favoriteRepository}) : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is FetchFavoriteEvent) {
        emit(FetchFavoriteLoadingState());
        var failureOrFavorites = await favoriteRepository.getFavorite();
        failureOrFavorites.fold(
          (failure) => FetchFavoriteErrorState(error: "${failure.runtimeType}"),
          (data) => emit(FetchFavoriteLoadedState(favorite: data.data!.items!)),
        );
      }
    });
  }
}
