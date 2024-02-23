package com.example.learn.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
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
import androidx.navigation.NavController
import com.example.learn.IssueRequest
import com.example.learn.IssueRequestList
import com.example.learn.network
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

@Composable
fun IssuesScreen(navController: NavController) {
    var issuesList by remember {
        mutableStateOf<List<IssueRequestList>>(emptyList())
    }

    val data = network().getIssueRequestsList()
    data.enqueue(object : Callback<List<IssueRequestList>?> {
        override fun onResponse(
            call: Call<List<IssueRequestList>?>,
            response: Response<List<IssueRequestList>?>
        ) {
            if (response.isSuccessful) {
                issuesList = response.body() ?: emptyList()
            }
        }

        override fun onFailure(call: Call<List<IssueRequestList>?>, t: Throwable) {
            TODO("Not yet implemented")
        }
    })

    LazyColumn() {
        items(issuesList) {
            IssueRequestListItem(issueRequest = it, navController)
        }
    }
}

@Composable
fun IssueRequestListItem(issueRequest: IssueRequestList, navController: NavController) {
    Column(
        Modifier.fillMaxWidth()
            .padding(1.dp).clickable {
                 navController.navigate("issue_detail/${issueRequest.issueRequestId}")
            }
    ) {
        Row() {
            Text(text = "" + issueRequest.issueRequestId)
            Text(text = " " + issueRequest.purpose, fontWeight = FontWeight.Light, fontSize = 22.sp)
        }
        Text(text = issueRequest.createdTime)
    }

}