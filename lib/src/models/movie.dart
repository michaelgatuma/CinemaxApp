class MovieModel
{
  var id;
  var name;
  var slug;
  var debut;

  var trailerId;
  var genres;

  var coverUrl;

  final List<String> months = [
    'Jan',
    'Fev',
    'Abr',
    'Mar',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez'
  ];

  MovieModel({ this.id, this.name, this.slug, this.debut, this.trailerId, this.coverUrl, this.genres });

  String get genresList => genres.map((genre) => genre['name']).join(', ');

  String get longDebut => _getLongDebut(debut);

  String _getLongDebut(debut) {
    if (debut != null) {
      final date = DateTime.parse(debut);

      final day = date.day;
      final month = months[date.month - 1];
      final year = date.year;

      return '$day $month, $year';
    }

    return '';
  }
}
