package com.jokeemporium.jokes

class User {

  enum Role {
    GUEST(0), USER(1), EDITOR(2), ADMIN(3)
    private final Integer role
    Role(Integer theRole) { role = theRole }
  }
  
  String userName
  String fullName
  String password
  Role role

  static constraints = {
    userName(nullable: false, unique: true)
    fullName(nullable: false)
    password(nullable: false)
    role(nullable: false)
  }

  String toString() { fullName }
  
  Boolean hasUserRights() { role >= Role.USER }
  Boolean hasEditorRights() { role >= Role.EDITOR }
  Boolean hasAdminRights() { role >= Role.ADMIN }

}

