using MapApp.Models;
using System.Net.Http;
using System.Net.Http.Json;
using System.Windows;

namespace MapApp.Data
{
    public static class Connection
    {
        public static CurrentUser CurrentUser { get; set; } = null!;
        public static string Url { get; set; } = "http://localhost:5291/api/";

        public static async Task<bool> AuthorizeAsync(string login, string password)
        {
            try
            {
                using HttpClient client = new HttpClient();
                var response = await client.GetFromJsonAsync<CurrentUser>(Url + $"Users/{login}/{password}");

                return response.Name != null;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
    }
}
