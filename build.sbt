organization := "org.helianto"

name := "helianto-spring-starter"

version := "1.0.0.RELEASE"

scalaVersion := "2.11.8"

libraryDependencies ++= Seq(
  "org.springframework.boot" % "spring-boot-starter-data-jpa" % "1.4.0.RELEASE",
  "com.zaxxer"               % "HikariCP"                     % "2.4.3",
  "com.h2database"           % "h2"                           % "1.4.192",
  "mysql"                    % "mysql-connector-java"         % "5.1.26"
)
