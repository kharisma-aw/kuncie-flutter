import 'package:kuncie_flutter_test/data/model/genre.dart';
import 'package:kuncie_flutter_test/data/network/model/genre_response_model.dart';

extension GenreResponseMapper on GenreResponse {
  Genre toDomainModel() {
    return Genre(
      id: id ?? -1,
      name: name ?? '',
    );
  }
}
