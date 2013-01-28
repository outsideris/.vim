name := "{%= name %}"

version := "{%= version %}"

scalaVersion := "{%= scalaversion %}"

scalacOptions ++= Seq("-deprecation")

libraryDependencies += "junit" % "junit" % "4.9" % "test"

libraryDependencies += "org.scalatest" % "scalatest_2.10" % "1.9" % "test"

EclipseKeys.withSource := true
