package com.jokeemporium.jokes

class Category {

    String name
    String description
    Integer displayOrder

    static hasMany = [categorisations: Categorisation]

    static constraints = {
        name()
        description(nullable: true)
        displayOrder()
        categorisations(nullable: true)
    }

}
