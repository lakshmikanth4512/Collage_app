# Use an official Tomcat image to run the application
FROM public.ecr.aws/docker/library/tomcat:9.0

# Optional: Remove default web apps if desired
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file built by Maven into Tomcat's webapps directory as ROOT.war
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
