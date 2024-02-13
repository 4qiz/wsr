using MapApp.Models;
using Newtonsoft.Json;
using System.Net.Http;

namespace MapApp.Data
{
    public class MockVisitorData
    {
        private const string ApiUrl = "http://localhost:5233/HospitalScheme/persons";
        public static async Task<List<Visitor>> GetVisitors()
        {
            using HttpClient client = new HttpClient();
            HttpResponseMessage response = await client.GetAsync(ApiUrl);
            string responseBody = await response.Content.ReadAsStringAsync();
            var settings = new JsonSerializerSettings { DateFormatString = "dd.MM.yyyy HH:mm" };
            List<Visitor> visitors = JsonConvert.DeserializeObject<List<Visitor>>(responseBody,settings);
            return visitors;
        }
    }
}
