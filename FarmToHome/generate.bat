#mvn archetype:generate -DgroupId=com.farn2home -DartifactId=FarmToHome -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

mvn -e clean install>maven.log

#mvn -e eclipse:eclipse>maven.log

#mvn -e clean install tomcat7:run>maven.log