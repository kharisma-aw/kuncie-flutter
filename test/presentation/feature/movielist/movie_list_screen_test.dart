import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuncie_flutter_test/common/model/paged_list.dart';
import 'package:kuncie_flutter_test/common/utils/string_utils.dart';
import 'package:kuncie_flutter_test/data/model/genre.dart';
import 'package:kuncie_flutter_test/data/model/movie.dart';
import 'package:kuncie_flutter_test/data/movie_repository.dart';
import 'package:kuncie_flutter_test/presentation/feature/movielist/movie_list_controller.dart';
import 'package:kuncie_flutter_test/presentation/feature/movielist/movie_list_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_app.dart';

class _MockMovieRepository extends Mock implements MovieRepository {}

class MockRoute extends Mock implements Route {}

// ignore: long-method
void main() {
  final movieRepository = _MockMovieRepository();
  late MovieListController sutController;

  setUp(() {
    sutController = MovieListController(movieRepository);
  });

  testWidgets(
    'Open screen, fetch data successfully, all item shown',
    (tester) async {
      when(
        () => movieRepository.getPopularMovies(),
      ).thenAnswer((_) async => PagedList(0, mockMovieList));
      await tester.pumpScreen(
        sutController,
        movieRepository,
      );
      await tester.pumpAndSettle();

      for (var movie in mockMovieList) {
        final movieCard = find.byKey(Key('movieCard${movie.id}'));
        expect(movieCard, findsOneWidget);
        expect(find.text(movie.title), findsOneWidget);
        expect(
          find.text(movie.releaseDate?.year.toString() ?? '-'),
          findsOneWidget,
        );
        expect(find.text(movie.voteAverage.toString()), findsOneWidget);

        await tester.tap(movieCard);
        await tester.pumpAndSettle();
        expect(
          find.text(movie.overview.ellipsizeByLength(240)),
          findsOneWidget,
        );
      }
    },
  );

  testWidgets(
    'Open screen, fetch empty data successfully, empty state shown',
    (tester) async {
      when(
        () => movieRepository.getPopularMovies(),
      ).thenAnswer((_) async => PagedList(0, []));
      await tester.pumpScreen(
        sutController,
        movieRepository,
      );
      await tester.pumpAndSettle();

      expect(find.text('No Result'), findsOneWidget);
      expect(find.text('Unfortunately, we\'re empty'), findsOneWidget);
    },
  );

  testWidgets(
    'Open screen, type in search bar, all item shown',
    (tester) async {
      when(
        () => movieRepository.getPopularMovies(),
      ).thenAnswer((_) async => PagedList(0, [mockMovieList.last]));

      await tester.pumpScreen(
        sutController,
        movieRepository,
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('searchBar')), 'asd');
      await tester.pumpAndSettle();

      final movieCard = find.byKey(Key('movieCard${mockMovieList.last.id}'));
      expect(movieCard, findsOneWidget);
      expect(find.text(mockMovieList.last.title), findsAtLeast(1));
      expect(
        find.text(mockMovieList.last.releaseDate?.year.toString() ?? '-'),
        findsOneWidget,
      );
      expect(
        find.text(mockMovieList.last.voteAverage.toString()),
        findsOneWidget,
      );

      expect(
        find.byKey(Key('movieCard${mockMovieList.first.id}')),
        findsNothing,
      );
    },
  );
}

extension _AgentListScreenTestExtension on WidgetTester {
  Future<void> pumpScreen(
    MovieListController sutController,
    MovieRepository agentRepository,
  ) async {
    return pumpWidget(
      TestApp(
        overrides: [
          MovieListController.provider.overrideWith((ref) => sutController),
          MovieRepository.provider.overrideWith((ref) => agentRepository),
        ],
        child: MovieListScreen(),
      ),
    );
  }
}

final mockMovieList = [
  Movie(
    adult: false,
    backdropPath: '/2PDTWfuBWQKVC7aPAqJK5UCpz08.jpg',
    genres: [
      Genre(id: 28, name: 'Action'),
      Genre(id: 878, name: 'Science Fiction'),
    ],
    id: 557,
    originalLanguage: 'en',
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.',
    popularity: 91.178,
    posterPath:
        'https://image.tmdb.org/t/p/original/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg',
    releaseDate: DateTime.parse('2002-05-01').toLocal(),
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.298,
    voteCount: 18760,
  ),
  Movie(
    adult: false,
    backdropPath: '/zlpZzccypkAYFZIyYLQcchl90ZC.jpg',
    genres: [
      Genre(id: 878, name: 'Science Fiction'),
      Genre(id: 28, name: 'Action'),
    ],
    id: 225914,
    originalLanguage: 'en',
    originalTitle: 'Amazing Spider-Man',
    overview:
        'When an extortionist threatens to force a multi-suicide unless a huge ransom is paid, only Peter Parker can stop him with his new powers as Spider-Man.',
    popularity: 20.671,
    posterPath:
        'https://image.tmdb.org/t/p/original/jNxRHZ2cxVkNRtxgHuCtv7GY4JP.jpg',
    releaseDate: DateTime.parse('1977-09-14').toLocal(),
    title: 'Amazing Spider-Man',
    video: false,
    voteAverage: 6.2,
    voteCount: 176,
  ),
];
