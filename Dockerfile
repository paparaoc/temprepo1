FROM maven AS s1
COPY ./src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean install

FROM tomcat
RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY --from=s1 /usr/src/app/target/app1.war /usr/local/tomcat/webapps/ROOT.war