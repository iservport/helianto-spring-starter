organization := "org.helianto"

name := "helianto-spring-starter"

version := "1.0.0.RELEASE"

scalaVersion := "2.11.8"

libraryDependencies ++= Seq(
  "org.helianto"            %% "helianto-material-skin"       % "1.0.0.RELEASE",
  "org.springframework.boot" % "spring-boot-starter-actuator" % "1.4.0.RELEASE"
)

resolvers  ++= Seq(
  "Helianto Releases"  at "s3://maven.helianto.org/release",
  "Helianto Snapshots" at "s3://maven.helianto.org/snapshot"
)