plugins {
    `java-library`
    id("software.amazon.smithy.gradle.smithy-jar")
}

sourceSets {
    main {
        java {
            srcDir("models")
        }
    }
}

repositories {
    mavenLocal()
    mavenCentral()
}

dependencies {
    val smithyVersion: String by project

    smithyCli("software.amazon.smithy:smithy-cli:$smithyVersion")
    implementation("software.amazon.smithy:smithy-model:$smithyVersion")
    implementation("software.amazon.smithy:smithy-linters:$smithyVersion")
}

tasks {
    smithyBuild {
        dependsOn(testSmithyBuild)
    }
}