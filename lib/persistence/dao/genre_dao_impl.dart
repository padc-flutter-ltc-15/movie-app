

import 'package:hive/hive.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

import '../../data/vos/genre_vo.dart';
import 'genre_dao.dart';

class GenreDaoImpl implements GenreDao {

  static final GenreDaoImpl _singleton = GenreDaoImpl._internal();

  factory GenreDaoImpl() {
    return _singleton;
  }

  GenreDaoImpl._internal() {

  }

  /// Reactive Programming

  Stream<void> getAllGenresEventStream() {
    return getGenreBox().watch();
  }

  Stream<List<GenreVO>> getGenresStream() {
    return Stream.value(
        getAllGenres()
            .toList()
    );
  }

  Stream<List<GenreVO>> getGenresByIdsStream(List<int> ids) {
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

  /// Reactive Programming

  void saveAllGenres(List<GenreVO> list) async {
    Map<int, GenreVO> map = Map.fromIterable(list,
      key: (genre) => genre.id,
      value: (genre) => genre
    );

    await getGenreBox().putAll(map);
  }

  List<GenreVO> getGenresByIds(List<int> ids) {
    List<GenreVO> allGenres = getGenreBox().values.toList();
    List<GenreVO> filteredGenres = List.empty(growable: true);

    for (var genre in allGenres) {
      for(var id in ids) {
        if(id == genre.id) {
          filteredGenres.add(genre);
        }
      }
    }

    return filteredGenres;
  }

  List<GenreVO> getAllGenres() {
    return getGenreBox().values.toList();
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box<GenreVO>(BOX_NAME_GENRE_VO);
  }
}