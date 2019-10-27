package com.jokeemporium.jokes

class Joke {

    String summary
    String body
    Date dateAdded

    static hasMany = [categorisations:Categorisation]

    static constraints = {
        summary()
        body(maxSize:32768)
        dateAdded()
        categorisations(nullable:true)
    }

    static mapping = {
        sort 'id': 'desc'
    }

    Boolean inCategory(Long categoryID) {
        //this.categorisations.findAll{it.category.id == categoryID}.size() > 0 ? true : false
        this.categoryIDs().contains(categoryID)
    }

    def categoryIDs() {
        this.categories().collect{it.id}
    }

    def categories() {
        return categorisations.collect{it.category}
    }

    String formatBody() {
        return body.replaceAll('\r\n', '<br />')
    }

    static Joke getRandomJoke() {
        return (Joke.count() > 0) ? Joke.findAll(offset:new Random().nextInt(Joke.count()), max:1)[0] : null
    }

    static Joke getRandomCleanJoke() {
        def cleanCategory = Category.findByName('Clean')
        if (!cleanCategory) {
            return null
        }
        else {
            def c = Joke.createCriteria()
            def results = c {
                categorisations {
                    category {
                        eq('name', 'Clean')
                    }
                }
            }
            return (results.size() > 0) ? results[new Random().nextInt(results.size())] : null
        }
    }

    static log(String s) {
        new Joke().log.info 'JOKE>>>>>>>>>>>>>>>> '  + s
    }

    static getJokesMatchingCategoryList(params) {
        if (params)
            log(params.toString())
        else
            log "NO PARAMS!!!"

        // Start by counting category matches for all jokes (Hibernate doesn't do "having")
        def criteria = Joke.createCriteria()
        def allResults = criteria {
            categorisations {
                'in'('category.id', params.categoryList)
            }
            projections {
                count('id')
                groupProperty('id')
            }
            order(params.sort ?: 'id', params.order ?: 'desc')
        }
        // Now filter out those that matched fewer categories than were asked for
        def filteredResults = []
        allResults.each {
            if (it[0] == params.categoryList.size())
                filteredResults << Joke.get(it[1])
        }
        // Now chunk results AND return total count
        def chunkedResults = []
        log "params.offset=" + params.offset + ", filteredResults.size=" + filteredResults.size()
        if (filteredResults.size > 0) {
            for (i in params.offset..Math.min(params.offset+params.max-1, filteredResults.size()-1))
                chunkedResults << filteredResults[i]
        }
        log "chunk=" + chunkedResults.size() + ", total=" + filteredResults.size()
        return [chunk:chunkedResults, total:filteredResults.size()]
    }

    static getJokesMatchingKeyword(params) {
        if (params)
            log(params.toString())
        else
            log "NO PARAMS!!!"

        def criteria = Joke.createCriteria()
        def results = criteria {
            or {
                like('summary', "%${params.keyword}%")
                like('body', "%${params.keyword}%")
            }
            order(params.sort ?: 'id', params.order ?: 'desc')
        }
        // Now chunk results AND return total count
        def chunkedResults = []
        log "params.offset=" + params.offset + ", results.size=" + results.size()
        if (results.size > 0) {
            //println("params.offset=${params.offset}")
            //println("params.max=${params.max}")
            for (i in params.offset..Math.min(params.offset+params.max-1, results.size()-1)) {
                //println("i=${i}")
                chunkedResults << results[i]
            }
        }
        log "chunk=" + chunkedResults.size() + ", total=" + results.size()
        return [chunk:chunkedResults, total:results.size()]
    }
}
