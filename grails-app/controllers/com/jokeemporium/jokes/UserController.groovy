package com.jokeemporium.jokes

import java.security.MessageDigest

class UserController {

  static scaffold = User

  def login = {
    //Console.println params
    if (params.cName)
      return [cName:params.cName, aName:params.aName]
  }

  def logout = {
    session.user = null
    redirect(uri:'/')
  }

  def validate = {
    def user = User.findByUserName(params.username)
    if (user && (user.password == params.password.encodeAsMD5())) {
      session.user = user
      if (params.cName)
        redirect(controller:params.cName, action:params.aName)
      else if (user.hasAdminRights())
        redirect(controller: 'dashboard')
      else
        redirect(uri:'/')
    }
    else {
      flash.message = "Invalid username or password"
      render(view:'login')
    }
  }
  
  def denied = {
  }

}
