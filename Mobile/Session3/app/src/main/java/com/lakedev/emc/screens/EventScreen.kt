package com.lakedev.emc.screens

import android.content.Context
import androidx.compose.foundation.gestures.scrollable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
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
import com.lakedev.emc.recorder.AudioRecorder
import com.lakedev.emc.recorder.Player
import java.io.File

@Composable
fun EventScreen(cacheDir: File, recorder: AudioRecorder, player: Player,File:File?) {
    var audioFile = File
    var title by remember { mutableStateOf("") }
    var price by remember { mutableStateOf("") }
    var date by remember { mutableStateOf("") }
    var eventTypeExpanded by remember { mutableStateOf(false) }
    Column(
        modifier = Modifier
            .padding(16.dp)
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(text = "Новый приём")
        OutlinedTextField(
            value = title,
            onValueChange = { title = it },
            modifier = Modifier.padding(6.dp),
            placeholder = { Text("название приема") }
        )
        OutlinedTextField(
            value = price,
            onValueChange = { price = it },
            modifier = Modifier.padding(6.dp),
            placeholder = { Text("цена") }
        )
        OutlinedTextField(
            value = price,
            onValueChange = { price = it },
            modifier = Modifier.padding(6.dp),
            placeholder = { Text("диагноз") }
        )
        OutlinedTextField(
            value = price,
            onValueChange = { price = it },
            modifier = Modifier.padding(6.dp),
            placeholder = { Text("рекомендации") }
        )
        OutlinedTextField(
            value = price,
            onValueChange = { price = it },
            modifier = Modifier.padding(6.dp),
            placeholder = { Text("направление") }
        )
        Text(text = "Добавить голосовое сообщение")
        Button(onClick = {
            File(cacheDir, "audio.mp3").also {
                recorder.startRecord(it)
                audioFile = it
            }
        }) {
            Text(text = "start record")
        }
        Button(onClick = { recorder.stopRecord() }) {
            Text(text = "stop record")
        }
        Button(onClick = { player.playFile(audioFile ?: return@Button) }) {
            Text(text = "play")
        }
    }
}



