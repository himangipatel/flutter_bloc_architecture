import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/screen/favourites/favourite_list.dart';
import 'package:flutter_bloc_architecture/screen/list/social_list.dart';


class FavouritesListBloc extends Bloc<FavouritesListEvent, FavouritesListSate> {
  final SocialMediaListBloc mainBloc;

  FavouritesListBloc(this.mainBloc) : super(FavouritesListEmpty()){
    if(this.mainBloc.state is SocialMediaListLoaded){
      add(FavouritesScreenStart((this.mainBloc.state as SocialMediaListLoaded).socialMedia));
    }
  }

  @override
  Stream<FavouritesListSate> mapEventToState(FavouritesListEvent event) async* {
    if (event is FavouritesScreenStart) {
      var favouritesList = event.list.where((item) => item.isFavourite).toList();
      yield FavouritesListLoaded(favouritesList);
    }
  }
}