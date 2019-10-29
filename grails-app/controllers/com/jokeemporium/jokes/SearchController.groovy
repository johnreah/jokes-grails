package com.jokeemporium.jokes

class SearchController {

    def index = {
        params['searchMode'] = params['searchMode'] ?: 'default'
        render(view: "index")
    }
    
    //-----------------------------------------------------------------------
    
    def searchByKeyword = {
      if (!params.keyword) {
        flash.message = "You must supply some text to search for"
        redirect(action: 'index')
        return
      }

      flash.message = null
      params.searchAction = 'searchByKeyword'
      params.args = [keyword: params.keyword]
      params.offset = params.offset ? params.int('offset') : 0
      params.max = Math.min(params.max ? params.int('max') : 10, 100)
      
      def matchingJokes = Joke.getJokesMatchingKeyword(params)
      def chunk = matchingJokes.chunk
      def total = matchingJokes.total
      if (total == 0) {
        flash.message = "No jokes were found containing the text '${params.keyword}'"
        render(view: 'index')
        return
      }
      
      params.total = total
      params.jokes = chunk

      render(view: 'index')
    }
    
    //-----------------------------------------------------------------------
    
    def searchByCategory = {
      def categoryList = []
      if (params.categoryList == null) {
          Category.list(order:'displayOrder').each { c ->
              if (params["cb${c.id}"] == "on")
                  categoryList << c.id
          }
          if (categoryList.size()  == 0) {
              flash.message = "You must select at least one category to search for"
              redirect(action: 'index')
              return
          }
          params.categoryList = categoryList
      }
      else
        params.categoryList = params.categoryList.findAll(/[0-9]+/){it.toLong()}
    
      flash.message = null
      params.searchAction = "searchByCategory"
      params.args = [categoryList: "${params.categoryList}"]
      params.offset = params.offset ? params.int('offset') : 0
      params.max = Math.min(params.max ? params.int('max') : 10, 100)
  
      def matchingJokes = Joke.getJokesMatchingCategoryList(params)
      def chunk = matchingJokes.chunk
      def total = matchingJokes.total
      if (total == 0) {
        flash.message = "No jokes were found matching that set of categories"
        render(view:'index')
        return
      }
      
      params.total = total
      params.jokes = chunk

      render(view: 'index')
    }
    
}
