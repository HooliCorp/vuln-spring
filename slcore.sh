#!/usr/bin/env bash

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
mvn compile package -Dmaven.test.skip=true
sl analyze --wait --app vuln-spring --tag branch=$GIT_BRANCH --remediation-config remediation.yaml --java --cpg target/vuln-spring-0.0.1-SNAPSHOT.jar
sl check-analysis --v2 --app vuln-spring --source tag.branch=master --branch $GIT_BRANCH --report
