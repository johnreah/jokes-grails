package com.jokeemporium.jokes

class JokeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static String stylesheet = "main"

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 15, 100)
        [jokeInstanceList: Joke.list(params), jokeInstanceTotal: Joke.count()]
    }

    def create = {
        def jokeInstance = new Joke()
        jokeInstance.properties = params
        return [jokeInstance: jokeInstance]
    }

    def save = {
        def jokeInstance = new Joke(params)
        if (jokeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'joke.label', default: 'Joke'), jokeInstance.id])}"
            redirect(action: "show", id: jokeInstance.id)
        }
        else {
            render(view: "create", model: [jokeInstance: jokeInstance])
        }
    }

    def show = {
        def jokeInstance = Joke.get(params.id)
        if (!jokeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'joke.label', default: 'Joke'), params.id])}"
            redirect(action: "list")
        }
        else {
            [jokeInstance: jokeInstance]
        }
    }

    def edit = {
        def jokeInstance = Joke.get(params.id)
        if (!jokeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'joke.label', default: 'Joke'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [jokeInstance: jokeInstance]
        }
    }

    def update = {
        def jokeInstance = Joke.get(params.id)
        if (jokeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (jokeInstance.version > version) {
                    jokeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'joke.label', default: 'Joke')] as Object[], "Another user has updated this Joke while you were editing")
                    render(view: "edit", model: [jokeInstance: jokeInstance])
                    return
                }
            }
            jokeInstance.properties = params
            if (!jokeInstance.hasErrors() && jokeInstance.save(flush: true)) {
                Category.list(order:'displayOrder').each { c ->
                    (params["cb${c.id}"] == "on") ? Categorisation.link(jokeInstance, c) : Categorisation.unlink(jokeInstance, c)
                }
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'joke.label', default: 'Joke'), jokeInstance.id])}"
                redirect(action: "show", id: jokeInstance.id)
            }
            else {
                render(view: "edit", model: [jokeInstance: jokeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'joke.label', default: 'Joke'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def jokeInstance = Joke.get(params.id)
        if (jokeInstance) {
            try {
                jokeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'joke.label', default: 'Joke'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'joke.label', default: 'Joke'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'joke.label', default: 'Joke'), params.id])}"
            redirect(action: "list")
        }
    }

    //-----------------------------------------------------------------------
    // Start of non-scaffold methods
    //-----------------------------------------------------------------------

    def randomJoke = {
        def jokeInstance = Joke.getRandomJoke()
        if (!jokeInstance) {
            flash.message = "Couldn't load a random joke!"
            redirect(action: "list")
        }
        else {
            render(view: "show", model: [jokeInstance: jokeInstance])
        }
    }

    def randomCleanJoke = {
        def jokeInstance = Joke.getRandomCleanJoke()
        if (!jokeInstance) {
            flash.message = "Couldn't load a random clean joke!"
            redirect(action: "list")
        }
        else {
            render(view: "show", model: [jokeInstance: jokeInstance])
        }
    }

    def ajaxRandomCleanJoke = {
        def jokeInstance = Joke.getRandomCleanJoke()
        if (!jokeInstance) {
            render "Couldn't load a random clean joke!"
        }
        else {
            render(template: "randomJoke", contentType: "text/plain", model: [jokeInstance: jokeInstance])
        }
    }
}
