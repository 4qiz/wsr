package com.lakedev.emc

sealed class Screen(val route: String) {
    object MainScreen : Screen("main_screen")
    object LoginScreen : Screen("login_screen")

    fun withArgs(vararg args: String): String {
        return buildString {
            append(route)
            args.forEach { append("/$it") }
        }
    }
}