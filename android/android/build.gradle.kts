<<<<<<< HEAD
// Top-level build file where you can add configuration options common to all sub-projects/modules.

plugins {
    id("com.google.gms.google-services") version "4.4.2" apply false
}

=======
>>>>>>> fb14b56 (Initial commit)
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
<<<<<<< HEAD

=======
>>>>>>> fb14b56 (Initial commit)
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
