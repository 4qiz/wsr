package com.lakedev.emc.screens

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.lakedev.emc.R
import com.lakedev.emc.Routes

@Composable
fun PatientScreen(navController: NavController) {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Image(
            painter = painterResource(id = R.drawable.patient),
            contentDescription = "photo",
            modifier = Modifier.clip(
                CircleShape
            )
        )
        InfoLabel(text = "name")
        Label(text = "Иван")

        InfoLabel(text = "surname")
        Label(text = "Иван")

        InfoLabel(text = "patronymic")
        Label(text = "Иван")

        InfoLabel(text = "date of birth")
        Label(text = "14.14.2222")

        InfoLabel(text = "pol")
        Label(text = "мужской")

        InfoLabel(text = "паспорт")
        Label(text = "1119 300300")
        Button(
            onClick = { navController.navigate(Routes.EventRoutes.route) },
            modifier = Modifier.fillMaxWidth(),
        ) {
            Text(text = "Начать приём", fontSize = 22.sp)
        }
    }

}

@Composable
fun InfoLabel(text: String) {
    Text(
        text = text, modifier = Modifier, fontStyle = FontStyle.Italic, fontSize = 14.sp
    )
}

@Composable
fun Label(text: String) {
    Text(
        text = text, modifier = Modifier, fontSize = 18.sp
    )
}