package com.lakedev.emc.recorder

import android.content.Context
import android.media.MediaPlayer
import androidx.core.net.toUri
import java.io.File

class Player(private val context: Context) {
    var player: MediaPlayer? = null

    fun playFile(file: File) {
        MediaPlayer.create(context, file.toUri()).apply {
            player = this
            start()
        }
    }

    fun stop() {
        player?.stop()
        player?.release()
        player = null
    }
}