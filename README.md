# jokes-grails
**jokes-grails** is a web application written in [Groovy](https://groovy-lang.org/)
and [Grails](https://grails.org/) to allow simple CRUD editing and categorisation of
a database of jokes that I've used as the basis of skill development projects for over
20 years.

Ever since the advent of email, people have been using it to send jokes. In the early
1990s I started gathering these in email folders, where they were sadly neglected.
During the late 90s I was working in a team that used Microsoft products extensively,
and so I moved the collection into an Access database that published its content via
an IIS service running on my desktop with some ASP pages written in VBScript.
It stayed there until Ruby on Rails came along, at which point I completely
reimplemented the database and application in Ruby and MySQL. This proved to be a really
good learning environment, as it involved realistic requirements for user authentication
and had a useful variety of database relationships to be modelled. When I switched
my attention from Ruby and Rails to Groovy and Grails in 2010 the site was rewritten
once again, and since about 2011 (it's now 2019) it's lived in the Cloud on an Amazon
EC2 t1.micro instance running AWS Linux and Tomcat 6.

My recent learning efforts have been focussed on Amazon Web Services (specifically
the Solution Architect and Developer qualifications), and this presented a convenient
opportunity to revisit the Grails application and update many aspects of it, including
the Grails version (it was originally developed in 1.x but the current version is
4.0.1), the code management system (from Subversion to Git), the build and deployment
pipeline (previously manual) and the hosting architecture (although the budget required
for a multi-AZ highly available and scalable deployment is sadly not justified).
 