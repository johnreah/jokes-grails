package com.jokeemporium.jokes

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class JokeServiceSpec extends Specification {

    JokeService jokeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Joke(...).save(flush: true, failOnError: true)
        //new Joke(...).save(flush: true, failOnError: true)
        //Joke joke = new Joke(...).save(flush: true, failOnError: true)
        //new Joke(...).save(flush: true, failOnError: true)
        //new Joke(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //joke.id
    }

    void "test get"() {
        setupData()

        expect:
        jokeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Joke> jokeList = jokeService.list(max: 2, offset: 2)

        then:
        jokeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        jokeService.count() == 5
    }

    void "test delete"() {
        Long jokeId = setupData()

        expect:
        jokeService.count() == 5

        when:
        jokeService.delete(jokeId)
        sessionFactory.currentSession.flush()

        then:
        jokeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Joke joke = new Joke()
        jokeService.save(joke)

        then:
        joke.id != null
    }
}
