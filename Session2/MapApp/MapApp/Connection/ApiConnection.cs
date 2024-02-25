using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json.Nodes;
using System.Threading.Tasks;

namespace MapApp.Connection
{
    public static class ApiConnection
    {
        private static string _url = @"http://localhost:5233/HospitalScheme/persons?count=100";
        public static async Task<List<Visitor>> GetVisitors()
        {
            using var httpClient = new HttpClient();
            var data = await httpClient.GetFromJsonAsync<List<Visitor>>(_url);
            if (data == null)
            {
                return null;
            }
            return data;
        }
    }
}
