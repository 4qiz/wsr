package com.lakedev.emc.data

import com.lakedev.emc.models.Doctor
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Path

interface IApi {
    @GET("/api/Users/{login}/{password}")
    fun getUser(
        @Path("login") login: String,
        @Path("password") password: String
    ): Response<Doctor>
}