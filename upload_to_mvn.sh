#!/bin/bash
upload() {
    ./gradlew clean assemble
    ./gradlew :core:uploadArchives
    ./gradlew :views:uploadArchives
    ./gradlew :blockcanary:uploadArchives
    ./gradlew :components:uploadArchives
    ./gradlew :runtime:uploadArchives

    ./gradlew :noop-java:uploadArchives
    ./gradlew :noop-kotlin:uploadArchives
}
uploadPrimary() {
    git checkout master
    upload
}
upload100EAP23() {
    git checkout v23/1.0.0EAP
    upload
}
upload100EAP22() {
    git checkout v22/1.0.0EAP
    upload
}
uploadPrimary
upload100EAP22
upload100EAP23