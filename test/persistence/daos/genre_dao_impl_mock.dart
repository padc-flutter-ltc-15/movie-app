
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/persistence/dao/genre_dao.dart';

class GenreDaoImplMock extends GenreDao {
  Map<int?, GenreVO> genreListFromDatabaseMock = {};

  @override
  List<GenreVO> getAllGenres() {
    return genreListFromDatabaseMock.values.toList();
  }

  @override
  void saveAllGenres(List<GenreVO> genreList) {
    genreList.forEach((genre) {
      genreListFromDatabaseMock[genre.id] = genre;
    });
  }

  @override
  Stream<void> getAllGenresEventStream() {
    return Stream<void>.value(null);
  }

  @override
  List<GenreVO> getGenresByIds(List<int> ids) {
    List<GenreVO> allGenres = genreListFromDatabaseMock.values.toList();
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

  @override
  Stream<List<GenreVO>> getGenresByIdsStream(List<int> ids) {
    List<GenreVO> allGenres = genreListFromDatabaseMock.values.toList();
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

  @override
  Stream<List<GenreVO>> getGenresStream() {
    return Stream.value(genreListFromDatabaseMock.values.toList());
  }
}
