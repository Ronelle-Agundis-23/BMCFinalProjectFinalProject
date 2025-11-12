buildscript {
    // *** FINAL FIX: Upgraded Kotlin from 1.7.10 to 1.8.20 ***
    val kotlin_version by extra("1.8.20")

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        // *** FINAL FIX: Upgraded AGP from 7.3.0 to 8.3.0 ***
        classpath("com.android.tools.build:gradle:8.3.0")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version")
        classpath("com.google.gms:google-services:4.3.15")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}