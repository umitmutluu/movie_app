enum NetworkQuery { page,search }

extension NetworkQueryExtension on NetworkQuery {
  MapEntry<String, int> pageQuery(int pageNumber) => MapEntry('page', pageNumber);
  MapEntry<String, String> searchQuery(String keyword) => MapEntry('query', keyword);
}
