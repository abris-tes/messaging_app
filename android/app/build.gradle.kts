plugins {
    // ✅ Kotlin plugin for Firebase compatibility
    id("org.jetbrains.kotlin.android") version "1.9.22" apply false
    // ✅ Google Services plugin for Firebase
    id("com.google.gms.google-services") version "4.4.2" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
