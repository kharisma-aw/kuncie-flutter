import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuncie_flutter_test/data/network/exceptions.dart';
import 'package:kuncie_flutter_test/localizations/localizations_utils.dart';
import 'package:kuncie_flutter_test/presentation/feature/movielist/movie_list_controller.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/app_snackbar.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/empty_state.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/movie_card.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/search_bar.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/shimmer_movie_card.dart';

class MovieListScreen extends ConsumerStatefulWidget {
  const MovieListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieListScreen();
}

class _MovieListScreen extends ConsumerState<MovieListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(MovieListController.provider.notifier).getPopularMovies();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          .95 * _scrollController.position.maxScrollExtent) {
        ref.read(MovieListController.provider.notifier).onScrolledToBottom();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenError();

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(MovieListController.provider.notifier).onRefreshed();
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSearchBar(
                    key: const Key('searchBar'),
                    placeholder: context.localizations.searchHere,
                    onChanged: ref
                        .read(MovieListController.provider.notifier)
                        .onSearchMovie,
                  ),
                  const SizedBox(height: 20),
                  _content(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Consumer(
      builder: (context, ref, child) {
        final movieListState = ref.watch(MovieListController.provider
            .select((state) => state.movieListState));
        final searchQuery = ref.watch(
          MovieListController.provider.select((state) => state.searchQuery),
        );
        final errorAction = ref.watch(
          MovieListController.provider.select((state) => state.errorAction),
        );

        return movieListState.when(
          data: (data) {
            if (data.isEmpty) {
              return searchQuery.isEmpty
                  ? EmptyState.empty(
                      title: context.localizations.noResult,
                      description: context.localizations.noMovieData,
                    )
                  : EmptyState.searchNotFound(
                      context: context,
                      query: searchQuery,
                    );
            } else {
              return _movieList();
            }
          },
          error: (e, s) {
            if (e.runtimeType == NoConnectionException) {
              return EmptyState.empty(
                title: context.localizations.oooooppss,
                description: context.localizations.connectionProblemOccured,
              );
            } else {
              return EmptyState.error(
                context: context,
                error: movieListState.error ?? Error(),
                onRetried: errorAction ?? () {},
              );
            }
          },
          loading: () => Column(
            children: [
              ShimmerMovieCard(),
              ShimmerMovieCard(),
            ],
          ),
        );
      },
    );
  }

  Widget _movieList() {
    return Consumer(
      builder: (context, ref, child) {
        final movies = ref.watch(MovieListController.provider
            .select((state) => state.movieListState.value ?? []));
        final expandedMovies = ref.watch(MovieListController.provider
            .select((state) => state.expandedMovies));
        final cardWidth = MediaQuery.of(context).size.width - 40;

        return ListView.builder(
          itemBuilder: (context, i) {
            if (i < movies.length) {
              final movie = movies[i];
              final isExpanded = expandedMovies.contains(movie.id);
              final onTap = () {
                ref
                    .read(MovieListController.provider.notifier)
                    .onItemClicked(movie.id);
              };

              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: MovieCard(
                  width: cardWidth,
                  data: movie,
                  onTap: onTap,
                  isExpanded: isExpanded,
                ),
              );
            } else {
              return _nextPageState();
            }
          },
          itemCount: movies.length + 1,
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
        );
      },
    );
  }

  Widget _nextPageState() {
    return Consumer(
      builder: (context, ref, child) {
        final nextPageUiState = ref.watch(
          MovieListController.provider.select((state) => state.nextPageUiState),
        );

        return nextPageUiState.when(
          data: (_) => const SizedBox(height: 12),
          error: (e, _) => const SizedBox(height: 12),
          loading: () => ShimmerMovieCard(),
        );
      },
    );
  }

  void _listenError() {
    ref.listen(
      MovieListController.provider.select((state) => state.nextPageUiState),
      (previous, next) {
        if (next is AsyncError) {
          switch (next.error.runtimeType) {
            case NoConnectionException:
              break;
            default:
              showAppSnackBar(
                context,
                SnackBarData(
                  message: context.localizations.errorOccured,
                  info: context.localizations.failedToLoadData,
                  action: context.localizations.retry,
                  type: SnackBarType.error,
                  onAction: ref.read(MovieListController.provider
                      .select((state) => state.errorAction)),
                ),
              );
              ref.read(MovieListController.provider.notifier).onSnackbarShown();
              break;
          }
        }
      },
    );
  }
}
