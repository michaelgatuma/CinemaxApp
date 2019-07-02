const MOVIES_QUERY = """
  query FEATURING_TODAY_MOVIES_QUERY {
    moviesFeaturingToday: moviesFeaturingToday(
      sessionCategory:"em-exibicao"
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
