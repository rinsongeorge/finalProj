#mvn archetype:generate -DgroupId=com.farn2home -DartifactId=FarmToHome -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

#mvn -e clean install>maven.log

#mvn -e eclipse:eclipse>maven.log


set JAVA_HOME=C:\JDK\jdk1.8.0_25\

set M2_HOME=D:\794162\software\apache-maven-2.2.1

set Path=C:\JDK\jdk1.8.0_25\bin;D:\794162\software\apache-maven-2.2.1\bin;%Path%

#mvn clean install>maven.log

mvn -e clean install tomcat7:run>maven.log