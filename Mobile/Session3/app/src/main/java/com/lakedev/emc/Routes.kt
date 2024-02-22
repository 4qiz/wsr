package com.lakedev.emc

sealed class Routes(val route: String) {
    object MainRoutes : Routes("main_screen")
    object LoginRoutes : Routes("login_screen")
    object PatientRoutes : Routes("patient_screen")
    object EventRoutes : Routes("event_screen")

    fun withArgs(vararg args: String): String {
        return buildString {
            append(route)
            args.forEach { append("/$it") }
        }
    }
}