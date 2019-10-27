package com.jokeemporium.jokes

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class JokeSpec extends Specification implements DomainUnitTest<Joke> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
