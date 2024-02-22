package com.example.learn

data class Medicine(
    val image: String ,
    val manufacturer: String,
    val medicineId: Int,
    val name: String,
    val price: Double,
    val stockQuantity: Int,
    val tradeName: String,
    val warehouseId: Int
)