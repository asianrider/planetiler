#!/usr/bin/env bash
./mvnw -DskipTests=true --projects planetiler-dist -am package
cp planetiler-dist/target/planetiler-dist-0.3-SNAPSHOT-with-deps.jar planetiler.jar
