import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/bloc/detail_bloc.dart';

import '../data_models/movie_model_imp_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Movie Details Bloc Test", () {
    DetailBloc? movieDetailsBloc;

    setUp(() {
      movieDetailsBloc = DetailBloc(1, MovieModelImplMock());
    });

    test("Fetch Movie Details Test", () {
      expect(movieDetailsBloc?.movieDetail, getMockMoviesForTest().last);
    });

    test("Fetch Creators Test", () {
      expect(movieDetailsBloc?.creators.contains(getMockActors()[1]),
          true);
    });

    test("Fetch Actors Test", () {
      expect(movieDetailsBloc?.actors.contains(getMockActors()[0]),
          true);
    });
  });
}
