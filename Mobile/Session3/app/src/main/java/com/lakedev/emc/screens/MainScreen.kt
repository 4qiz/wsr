package com.lakedev.emc.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.lakedev.emc.Routes

@Composable
fun MainScreen(doctor: String? = "not mainsc", navController: NavController) {
    var medCardId by remember {
        mutableStateOf("")
    }
    Column(modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally) {
        Text(text = "номер мед карты пациента")
        OutlinedTextField(
            value = medCardId,
            onValueChange = { medCardId = it },
            modifier = Modifier.padding(6.dp)
        )
        Button(onClick = { navController.navigate(Routes.PatientRoutes.route) }) {
            Text(text = "Найти пациента")
        }
    }
}