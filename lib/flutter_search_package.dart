library flutter_search_package;

class SearchHelper {
  /// Searches through a list of items and returns the items that match the query.
  ///
  /// [items] is the list of items to search through.
  /// [query] is the search term.
  static List<T> search<T>(List<T> items,
      bool Function(T item, String query) matcher, String query) {
    return items.where((item) => matcher(item, query)).toList();
  }
}
