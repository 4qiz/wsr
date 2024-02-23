package com.example.learn

data class IssueRequest(
    val medicineId: Int,
    val name: String,
    val image: String,
    val quantity: Int
)