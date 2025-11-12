plugins {
    id("com.android.application")
    id("kotlin-android")
    // Use the Google Services plugin defined in the root build.gradle.kts
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.ecommerce_app" // Replace 'com.example.ecommerce_app' with your actual package name
    compileSdk = 33 // Recommended compile SDK version

    defaultConfig {
        // TODO: Specify your application ID here.
        applicationId = "com.example.ecommerce_app"
        minSdk = 21
        targetSdk = 33
        versionCode = 1
        versionName = "1.0.0"
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    signingConfigs {
        create("release") {
            // Add your release signing configuration here if needed, or leave it empty for debug builds
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            // Debug build type settings
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Add your app-level dependencies here
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
}