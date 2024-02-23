package com.example.learn.screens

import android.content.Context
import android.widget.Toast
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.currentCompositionLocalContext
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.learn.Medicine
import com.example.learn.network
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

@Composable
fun MedicinesList(navController: NavController, context: Context) {
    var medicinesList by remember {
        mutableStateOf<List<Medicine>>(emptyList())
    }
    val data = network().getMedicines()
    data.enqueue(object : Callback<List<Medicine>?> {
        override fun onResponse(
            call: Call<List<Medicine>?>, response: Response<List<Medicine>?>
        ) {
            medicinesList = response.body() ?: emptyList()
        }

        override fun onFailure(call: Call<List<Medicine>?>, t: Throwable) {
            Toast.makeText(
                context, "не удалось получить данные", Toast.LENGTH_SHORT
            ).show()
        }
    })
    if (medicinesList.isEmpty()) {
        CircularProgressIndicator()
    } else {
        LazyColumn {
            items(medicinesList) {
                MedicineItem(it, navController)
            }
        }
    }
}


@Composable
fun MedicineItem(medicine: Medicine, navController: NavController) {
    Column(modifier = Modifier
        .fillMaxWidth()
        .padding(3.dp)
        .clickable {
            navController.navigate("medicines_list/${medicine.medicineId}")
        }) {
        Row {
            Text(
                text = medicine.name, fontSize = 16.sp
            )
        }
        Spacer(modifier = Modifier.padding(12.dp))
        Row {
            Text(text = "Цена: " + medicine.price.toString() + "P")
            Spacer(modifier = Modifier.padding(6.dp))
            Text(text = "Количество: " + medicine.stockQuantity.toString())
        }
    }
}