#!/bin/sh
set -e

if [ "${JAVA_HOME}" != "${PREFIX}" ] && [ "${JAVA_HOME}" != "${PREFIX}/Library" ]; then
  echo "ERROR: JAVA_HOME (${JAVA_HOME}) not equal to PREFIX (${PREFIX} or ${PREFIX}/Library)"
fi

${JAVA_HOME}/bin/java -version

pushd test-nio
  javac TestFilePaths.java
  jar cfm TestFilePaths.jar manifest.mf TestFilePaths.class
  java -jar TestFilePaths.jar TestFilePaths.java
popd
