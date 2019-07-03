const MOVIES_FEATURING_TODAY_QUERY = """
  query FEATURING_TODAY_MOVIES_QUERY(\$sessionCategory: String) {
    moviesFeaturingToday: moviesFeaturingToday(
      sessionCategory: \$sessionCategory
    ) {
      id
      name
      slug
      trailerId
      hasSessions
      genres {
        id
        name
      }
      picture {
        id
        thumb(size: COVER) {
          id
          url
        }
      }
    }
  }
""";

const UPCOMING_MOVIES_QUERY = """
  query UPCOMING_MOVIES_QUERY {
    upcomingMovies {
      id
      name
      slug
      debut
      trailerId
      hasSessions
      genres {
        id
        name
      }
      picture {
        id
        thumb(size: COVER) {
          id
          url
        }
      }
    }
  }
""";
