package com.example.learn.screens

import android.content.Context
import android.widget.Spinner
import android.widget.Toast
import androidx.compose.foundation.gestures.rememberScrollableState
import androidx.compose.foundation.gestures.scrollable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.TextUnitType
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.learn.Medicine
import com.example.learn.Medicine2
import com.example.learn.network
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

@Composable
fun MedicineDetailScreen(id: Int, context: Context) {
    var med by remember {
        mutableStateOf<Medicine2?>(null)
    }
    val data = network().getMedicine(id)
    data.enqueue(object : Callback<Medicine2?> {
        override fun onResponse(call: Call<Medicine2?>, response: Response<Medicine2?>) {
            val medicine = response.body()
            med = medicine
        }

        override fun onFailure(call: Call<Medicine2?>, t: Throwable) {

        }
    })
    Column(
        Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        if (med == null) {
            CircularProgressIndicator(
                modifier = Modifier.width(34.dp),
                color = Color.Cyan
            )
        } else {
            MedicineInfo(med!!)
        }
    }
}

@Composable
fun MedicineInfo(med: Medicine2) {
    Column(
        Modifier
            .fillMaxSize()
            .padding(12.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.Top,
        horizontalAlignment = Alignment.Start
    ) {
        Text(
            text = "" + med.name,
            fontWeight = FontWeight.Medium,
            fontSize = 34.sp,
            textAlign = TextAlign.Start,
            lineHeight = TextUnit(40f, TextUnitType.Sp)
        )
        Text(text = "Производитель " + med.manufacturer)
        Text(text = "" + med.tradeName)
        Text(
            text = "Количество " + med.stockQuantity.toString(),
            fontWeight = FontWeight.SemiBold,
            fontSize = 20.sp
        )
        Text(
            text = "Цена:" + "%.2f".format(med.price),
            fontWeight = FontWeight.Thin,
            fontSize = 28.sp,
            textAlign = TextAlign.End,
            modifier = Modifier.fillMaxWidth()
        )
    }
}
