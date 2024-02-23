package com.example.learn.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.learn.IssueRequest
import com.example.learn.network
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

@Composable
fun IssueDetailScreen(id: Int) {
    var issueRequest by remember {
        mutableStateOf<List<IssueRequest>>(emptyList())
    }
    val data = network().getIssueRequestDetail(id)
    data.enqueue(object : Callback<List<IssueRequest>?> {
        override fun onResponse(
            call: Call<List<IssueRequest>?>,
            response: Response<List<IssueRequest>?>
        ) {
            issueRequest = response.body() ?: emptyList()
        }

        override fun onFailure(call: Call<List<IssueRequest>?>, t: Throwable) {

        }
    })

    if (issueRequest.isEmpty()) {
        CircularProgressIndicator()
    } else {
        IssueRequestItem(issueRequest)
    }
}

@Composable
fun IssueRequestItem(issueRequest: List<IssueRequest>) {
    LazyColumn() {
        items(issueRequest) {
            Column(Modifier.padding(9.dp)) {
                Text(text = it.name, fontWeight = FontWeight.Light,
                    fontSize = 22.sp)
                Text(text = "Количество: " + it.quantity.toString())
            }
        }
    }
}
