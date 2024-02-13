package com.lakedev.emc.screens

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable

@Composable
fun MainScreen(doctor: String? = "not mainsc") {
    Column {
        if (doctor != null) {
            Text(text = doctor)
        }
    }
}