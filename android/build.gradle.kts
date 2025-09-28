allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Configuración para resolver problemas de namespace y compileSdk
subprojects {
    afterEvaluate {
        if (project.hasProperty("android")) {
            val android = project.extensions.getByName("android") as com.android.build.gradle.BaseExtension
            if (android.namespace == null) {
                android.namespace = "dev.isar.isar_flutter_libs"
            }
            // Forzar compileSdk a 34 para resolver problemas de dependencias
            if (project.name == "isar_flutter_libs") {
                android.compileSdkVersion(34)
            }
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
