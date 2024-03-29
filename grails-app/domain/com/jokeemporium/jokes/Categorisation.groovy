package com.jokeemporium.jokes

class Categorisation {

    Joke joke
    Category category
  
    static belongsTo = [joke:Joke, category:Category]

    static constraints = {
        joke(nullable:false)
        category(nullable:false)
    }
  
    static Categorisation link(joke, category) {
        def categorisation = Categorisation.findByJokeAndCategory(joke, category)
        if (!categorisation) {
            categorisation = new Categorisation()
            joke.addToCategorisations(categorisation)
            category.addToCategorisations(categorisation)
            categorisation.save(flush:true)
        }
        return categorisation
    }
  
    static void unlink(joke, category) {
        def c = Categorisation.findByJokeAndCategory(joke, category)
        if (c) {
            joke.removeFromCategorisations(c)
            category.removeFromCategorisations(c)
            c.delete(flush:true)
        }
    }
  
}
