import java.io.ByteArrayOutputStream

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



val updatePackageVersions = tasks.register<Exec>("UpdatePackageVersions") {
    description = "Updates smithy-build.json to match the latest semver git tag, tagged with 'v' prefix."
    group = "build"

    workingDir(projectDir)
    commandLine("git", "tag", "--sort=version:refname", "--list", "v*")
    standardOutput = ByteArrayOutputStream()

    doLast {
        val output = standardOutput.toString().trim()

        if (output.isEmpty()) {
            throw GradleException("No semantic version tags found in the repository.")
        }

        val tags = output.lines()
        val latestTag = tags.last()
        val version = latestTag.substring(1)

        check(SemanticVersionStringValidator.isValid(version))

        val semVer = SemanticVersionConverter.convert(version)

        val smithyBuildFile = File(projectDir.path + "/smithy-build.json")
        val editor = SmithyBuildEditor(smithyBuildFile)
        editor.updatePackageVersions(semVer)
    }
}

tasks {
   smithyBuild {
       dependsOn(updatePackageVersions)
   }
}

repositories {
    mavenLocal()
    mavenCentral()
}

dependencies {
    implementation("software.amazon.smithy.typescript:smithy-typescript-codegen:0.21.1")
    implementation("software.amazon.smithy.typescript:smithy-aws-typescript-codegen:0.21.1")
    implementation("software.amazon.smithy:smithy-model:1.50.0")
    implementation("software.amazon.smithy:smithy-validation-model:1.49.0")
    implementation("software.amazon.smithy:smithy-linters:1.50.0")
    implementation("software.amazon.smithy:smithy-aws-traits:1.50.0")
}
