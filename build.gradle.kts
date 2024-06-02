plugins {
    `java-library`
    id("software.amazon.smithy.gradle.smithy-jar")
}

sourceSets {
    main {
        java {
            srcDir("model")
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
    smithyBuild("software.amazon.smithy.typescript:smithy-aws-typescript-codegen:0.20.1")

    implementation("software.amazon.smithy:smithy-model:$smithyVersion")
    implementation("software.amazon.smithy:smithy-linters:$smithyVersion")
    implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")

}

// TODO: ensure I run testSmithyBuild somewhere - it's what validates stuff
tasks {
    smithyBuild {
//        dependsOn(testSmithyBuild)
    }
}