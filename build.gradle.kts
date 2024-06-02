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
    implementation("software.amazon.smithy.typescript:smithy-typescript-codegen:0.21.0")
    implementation("software.amazon.smithy:smithy-model:1.49.0")
    implementation("software.amazon.smithy:smithy-linters:1.49.0")
    implementation("software.amazon.smithy:smithy-aws-traits:1.49.0")
}
