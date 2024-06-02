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
    smithyCli("software.amazon.smithy:smithy-cli:1.49.0")
    smithyBuild("software.amazon.smithy.typescript:smithy-aws-typescript-codegen:0.20.1")

    implementation("software.amazon.smithy:smithy-model:1.49.0")
    implementation("software.amazon.smithy:smithy-linters:1.49.0")
    implementation("software.amazon.smithy:smithy-aws-traits:1.49.0")

}

// TODO: ensure I run testSmithyBuild somewhere - it's what validates stuff
tasks {
    smithyBuild {
//        dependsOn(testSmithyBuild)
    }
}