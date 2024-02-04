using MapApp.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace MapApp.Data
{
    public class MockVisitorData
    {
        private const string ApiUrl = "http://localhost:5157/api/valuevisitor";
        public static async Task<List<Visitor>> GetVisitors()
        {
            
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = await client.GetAsync(ApiUrl);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();

                List<Visitor> visitors = JsonConvert.DeserializeObject<List<Visitor>>(responseBody);
                return visitors;
            }
        }
    }
}
