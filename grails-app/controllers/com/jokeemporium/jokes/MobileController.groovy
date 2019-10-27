package com.jokeemporium.jokes

class MobileController {

    def index = {
        redirect(action: "randomCleanJoke", params: params)
    }
    
    def randomCleanJoke = {
        def jokeInstance = Joke.getRandomCleanJoke()
        if (!jokeInstance) {
            render("Sorry - couldn't load a random clean joke!")
        }
        else {
            render(view: "show", model: [jokeInstance: jokeInstance])
        }
    }
    
}
