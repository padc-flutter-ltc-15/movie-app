
import '../../data/vos/genre_vo.dart';

abstract class GenreDao {
  Stream<void> getAllGenresEventStream();
  Stream<List<GenreVO>> getGenresByIdsStream(List<int> ids);
  List<GenreVO> getGenresByIds(List<int> ids);
  Stream<List<GenreVO>> getGenresStream();

  void saveAllGenres(List<GenreVO> genreList);
  List<GenreVO> getAllGenres();
}