import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:integration_test/integration_test.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/date_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/main.dart';
import 'package:themovieapp/persistence/hive_constants.dart';
import 'package:themovieapp/screens/home_screen.dart';

import 'test_data/test_data.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ActorVOAdapter());
  Hive.registerAdapter(DateVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());

  await Hive.openBox<ActorVO>(BOX_NAME_ACTOR_VO);
  await Hive.openBox<MovieVO>(BOX_NAME_MOVIE_VO);
  await Hive.openBox<GenreVO>(BOX_NAME_GENRE_VO);

  testWidgets("Tap Best Popular Movies And Navigate to Details Test", (WidgetTester tester) async {

    // Pumping widget to Screen
    await tester.pumpWidget(const MyApp());
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Finding Specific Widget
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text(TEST_DATA_POPULAR_MOVIE_NAME), findsOneWidget);

    // Tapping the Widget and Waiting to settle
    await tester.tap(find.text(TEST_DATA_POPULAR_MOVIE_NAME));
    await tester.pumpAndSettle(const Duration(seconds: 5));


    // Checking if it is the expected screen or not
    expect(find.text(TEST_DATA_POPULAR_MOVIE_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_POPULAR_RATING), findsOneWidget);
    expect(find.text(TEST_DATA_POPULAR_RELEASED_YEAR), findsOneWidget);
  });
}