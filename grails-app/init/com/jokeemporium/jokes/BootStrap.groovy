package com.jokeemporium.jokes

import com.jokeemporium.jokes.Joke
import com.jokeemporium.jokes.JokeService

class BootStrap {

    JokeService jokeService

    def init = { servletContext ->
        log.info("Num jokes:" + jokeService.count())
    }
    def destroy = {
    }
}
