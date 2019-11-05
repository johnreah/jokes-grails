#!/bin/bash
#============================================================================
# Bash fragments for setting up a new AWS Linux 2 instance. They can be
# either pasted into a console or added to the user-data section of the EC2
# instance wizard for once-only execution on instance creation.
#============================================================================

# get admin privileges - not necessary on instance creation through user-data
sudo su

# bomb out immediately on error (may help with debugging)
set -e

# update existing packages
yum update -y

# install htop
yum install -y htop

# install httpd
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html

# install open-jdk
yum install -y java-1.8.0-openjdk

# use amazon extras to instalk JDK11
# test with alternatives --config java
amazon-linux-extras install java-openjdk11 -y

# Install Tomcat from AWS Extras (only 8.5)
# tomcat:   /usr/share/tomcat
# bin:      /usr/share/tomcat/bin
# conf:     /usr/share/tomcat/conf     -> /etc/tomcat
# lib:      /usr/share/tomcat/lib      -> /usr/share/java/tomcat
# logs:     /usr/share/tomcat/logs     -> /var/log/tomcat
# temp:     /usr/share/tomcat/temp     -> /var/cache/tomcat/temp
# webapps:  /usr/share/tomcat/webapps  -> /var/lib/tomcat/webapps
# work:     /usr/share/tomcat/work     -> /var/cache/tomcat/work
# service:  /usr/lib/systemd/system/tomcat.service
amazon-linux-extras install tomcat8.5 -y
chown -R tomcat:tomcat /usr/share/tomcat
systemctl enable tomcat.service
systemctl start tomcat.service
yum install -y tomcat-webapps
yum install -y tomcat-admin-webapps

# Install Tomcat 9 (not systemd)
useradd -m -U -d /opt/tomcat -s /bin/false tomcat
cd /tmp
wget http://apache.mirror.anlx.net/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
tar -xf apache-tomcat-9.0.27.tar.gz
mv apache-tomcat-9.0.27 /opt/tomcat
chown -R tomcat:tomcat /opt/tomcat
cat > /etc/systemd/system/tomcat2.service <<- EOF
	line1
	line2
EOF

# MariaDB
yum install -y mariadb-server
systemctl enable mariadb.service
systemctl start mariadb.service

# Environment variables
echo "export JOKES_DB_USER=jokes_grails" > /etc/profile.d/variables.sh
echo "export JOKES_DB_PASSWORD=jokes_grails" >> /etc/profile.d/variables.sh
