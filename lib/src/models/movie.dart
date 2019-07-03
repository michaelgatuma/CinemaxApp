class MovieModel
{
  var id;
  var name;
  var slug;

  var trailerId;
  var genres;

  var coverUrl;

  MovieModel({ this.id, this.name, this.slug, this.trailerId, this.coverUrl, this.genres });

  String get genresList => genres.map((genre) => genre['name']).join(', ');
}
