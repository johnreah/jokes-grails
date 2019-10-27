package com.jokeemporium.jokes

class JokesTagLib {

    def loginToggle = {
        out << "<br/><br/><div>"
        if (session.user){
            out << "<span style='float:left'>"
            out << "Welcome, ${session.user}"
            out << "</span>"
            out << "<span style='float:right;margin-right:10px;'>"
            out << "<a href='${createLink(controller:'user', action:'logout')}'>Logout</a>"
            out << "</span>"
        }
        else{
            out << "<span style='float:left;margin-right:10px;'>"
            out << "<a href='${createLink(controller:'user', action:'login')}'>Login</a>"
            out << "</span>"
        }
        out << "</div>"
    }

}
