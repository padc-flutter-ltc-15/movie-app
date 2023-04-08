

import 'package:hive/hive.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

import '../../data/vos/genre_vo.dart';

class GenreDao {

  static final GenreDao _singleton = GenreDao._internal();

  factory GenreDao() {
    return _singleton;
  }

  GenreDao._internal() {

  }

  Stream<void> getAllGenresEventStream() {
    return getGenreBox().watch();
  }

  void saveAllGenres(List<GenreVO> list) async {
    Map<int, GenreVO> map = Map.fromIterable(list,
      key: (genre) => genre.id,
      value: (genre) => genre
    );

    await getGenreBox().putAll(map);
  }

  Stream<List<GenreVO>> getGenresByIds(List<int> ids) {
    List<GenreVO> allGenres = getGenreBox().values.toList();
    List<GenreVO> filteredGenres = List.empty(growable: true);

    for (var genre in allGenres) {
      for(var id in ids) {
        if(id == genre.id) {
          filteredGenres.add(genre);
        }
      }
    }

    return Stream.value(filteredGenres);
  }

  Stream<List<GenreVO>> getAllGenres() {
    return Stream.value(getGenreBox().values.toList());
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box<GenreVO>(BOX_NAME_GENRE_VO);
  }
}