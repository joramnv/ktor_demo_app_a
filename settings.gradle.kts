pluginManagement {
    repositories {
        gradlePluginPortal()
        mavenCentral()
    }
    plugins {
        kotlin("jvm") version "1.4.32"
    }
}

rootProject.name = "ktor-demo-app-a"
include("app_base", "app_a")
project(":app_base").projectDir = File("../ktor_demo_app_base")
