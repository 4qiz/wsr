package com.example.learn
import retrofit2.Call
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Path

interface MyAPi {
    @GET("api/medicine")
    fun getMedicines():Call<List<Medicine>>

    @GET("api/medicine/{id}")
    fun getMedicine(@Path("id") id: Int): Call<Medicine2>
}