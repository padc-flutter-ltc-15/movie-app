

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

  void saveAllGenres(List<GenreVO> list) async {
    Map<int, GenreVO> map = Map.fromIterable(list,
      key: (genre) => genre.id,
      value: (genre) => genre
    );

    await getGenreBox().putAll(map);
  }

  List<GenreVO> getAllGenres() {
    return getGenreBox().values.toList();
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box<GenreVO>(BOX_NAME_GENRE_VO);
  }
}