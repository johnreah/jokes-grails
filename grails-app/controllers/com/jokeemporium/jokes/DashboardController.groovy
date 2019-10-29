package com.jokeemporium.jokes

class DashboardController {

    def index = {
        if (!session.user || !session.user.hasAdminRights())
            redirect(url: '/')
    }
    
}
