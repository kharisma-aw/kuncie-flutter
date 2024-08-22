import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuncie_flutter_test/data/model/genre.dart';
import 'package:kuncie_flutter_test/data/model/movie.dart';
import 'package:kuncie_flutter_test/data/movie_repository.dart';
import 'package:kuncie_flutter_test/data/network/http_client.dart';
import 'package:mocktail/mocktail.dart';

class _MockHttpClient extends Mock implements HttpClient {}

// ignore: long-method
void main() {
  late MovieRepository sut;
  late HttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = _MockHttpClient();
    final container = ProviderContainer(
      overrides: [
        HttpClient.provider.overrideWithValue(mockHttpClient),
      ],
    );
    addTearDown(container.dispose);

    sut = container.read(MovieRepository.provider);
  });

  test(
    'get popular movies successfully',
    () async {
      when(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/movie/popular',
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (invocation) async {
          return jsonDecode(mockResponse) as Map<String, dynamic>;
        },
      );
      when(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/genre/movie/list',
        ),
      ).thenAnswer(
        (invocation) async {
          return jsonDecode(mockGenresResponse) as Map<String, dynamic>;
        },
      );
      when(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/configuration',
        ),
      ).thenAnswer(
        (invocation) async {
          return jsonDecode(mockConfigResponse) as Map<String, dynamic>;
        },
      );

      final result = await sut.getPopularMovies(page: 1);
      verify(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/movie/popular',
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
      expect(result.items, mockMovieList);
      expect(result.nextPageKey, 2);
    },
  );

  test(
    'search movies successfully',
    () async {
      when(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/search/movie',
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (invocation) async {
          return jsonDecode(mockResponse) as Map<String, dynamic>;
        },
      );
      when(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/genre/movie/list',
        ),
      ).thenAnswer(
        (invocation) async {
          return jsonDecode(mockGenresResponse) as Map<String, dynamic>;
        },
      );
      when(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/configuration',
        ),
      ).thenAnswer(
        (invocation) async {
          return jsonDecode(mockConfigResponse) as Map<String, dynamic>;
        },
      );

      final result = await sut.searchMovies(query: 'spiderman', page: 1);
      verify(
        () => mockHttpClient.get<Map<String, dynamic>>(
          path: '/3/search/movie',
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
      expect(result.items, mockMovieList);
      expect(result.nextPageKey, 2);
    },
  );
}

const String mockResponse = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/2PDTWfuBWQKVC7aPAqJK5UCpz08.jpg",
      "genre_ids": [
        28,
        878
      ],
      "id": 557,
      "original_language": "en",
      "original_title": "Spider-Man",
      "overview": "After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.",
      "popularity": 91.178,
      "poster_path": "/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg",
      "release_date": "2002-05-01",
      "title": "Spider-Man",
      "video": false,
      "vote_average": 7.298,
      "vote_count": 18760
    },
    {
      "adult": false,
      "backdrop_path": "/zlpZzccypkAYFZIyYLQcchl90ZC.jpg",
      "genre_ids": [
        878,
        28
      ],
      "id": 225914,
      "original_language": "en",
      "original_title": "Spider-Man",
      "overview": "When an extortionist threatens to force a multi-suicide unless a huge ransom is paid, only Peter Parker can stop him with his new powers as Spider-Man.",
      "popularity": 20.671,
      "poster_path": "/jNxRHZ2cxVkNRtxgHuCtv7GY4JP.jpg",
      "release_date": "1977-09-14",
      "title": "Spider-Man",
      "video": false,
      "vote_average": 6.2,
      "vote_count": 176
    }
  ],
  "total_pages": 2,
  "total_results": 4
}
''';

const String mockGenresResponse = '''
{
  "genres": [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 878,
      "name": "Science Fiction"
    }
  ]
}
''';

const String mockConfigResponse = '''
{
  "images": {
    "base_url": "http://image.tmdb.org/t/p/",
    "secure_base_url": "https://image.tmdb.org/t/p/",
    "backdrop_sizes": [],
    "logo_sizes": [],
    "poster_sizes": [
      "w92",
      "w154",
      "w185",
      "w342",
      "w500",
      "w780",
      "original"
    ],
    "profile_sizes": [],
    "still_sizes": []
  },
  "change_keys": []
}
''';

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
    originalTitle: 'Spider-Man',
    overview:
        'When an extortionist threatens to force a multi-suicide unless a huge ransom is paid, only Peter Parker can stop him with his new powers as Spider-Man.',
    popularity: 20.671,
    posterPath:
        'https://image.tmdb.org/t/p/original/jNxRHZ2cxVkNRtxgHuCtv7GY4JP.jpg',
    releaseDate: DateTime.parse('1977-09-14').toLocal(),
    title: 'Spider-Man',
    video: false,
    voteAverage: 6.2,
    voteCount: 176,
  ),
];
