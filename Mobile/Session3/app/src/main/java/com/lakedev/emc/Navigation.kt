package com.lakedev.emc

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.lakedev.emc.MainActivity
import com.lakedev.emc.recorder.AudioRecorder
import com.lakedev.emc.recorder.Player
import com.lakedev.emc.screens.EventScreen
import com.lakedev.emc.screens.LoginScreen
import com.lakedev.emc.screens.MainScreen
import com.lakedev.emc.screens.PatientScreen
import java.io.File

@Composable
fun Navigation(cacheDir: File, recorder: AudioRecorder, player: Player, audioFile: File?) {
    val navController = rememberNavController()
    NavHost(navController = navController, startDestination = Routes.LoginRoutes.route) {
        composable(Routes.LoginRoutes.route) {
            LoginScreen(navController)
        }
        composable(Routes.MainRoutes.route + "/{name}",
            arguments = listOf(
                navArgument("name") {
                    type = NavType.StringType
                    defaultValue = "NotLogin"
                    nullable = true
                }
            )) { entry ->
            MainScreen(entry.arguments?.getString("name"), navController)
        }
        composable(Routes.PatientRoutes.route) {
            PatientScreen(navController)
        }
        composable(Routes.EventRoutes.route) {
            EventScreen(cacheDir, recorder, player,audioFile)
        }
    }
}