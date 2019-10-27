package com.jokeemporium.jokes

import grails.gorm.services.Service

@Service(Joke)
interface JokeService {

    Joke get(Serializable id)

    List<Joke> list(Map args)

    Long count()

    void delete(Serializable id)

    Joke save(Joke joke)

}