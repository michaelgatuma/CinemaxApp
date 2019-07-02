const MOVIES_QUERY = """
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
        name
      }
      picture {
        thumb(size: COVER) {
          url
        }
      }
    }
  }
""";
