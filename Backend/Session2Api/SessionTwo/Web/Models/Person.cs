using System.Text.Json.Serialization;

namespace Web.Models
{
    
    public record Person
    {
        [JsonIgnore]
        const int RANDOM_MINUTES_AGO = 10;
        [JsonIgnore]
        const int POINT_COUNT = 23;

        public string PersonCode => Guid.NewGuid().ToString().Substring(0, 4).ToUpper(); // уникальный код клиента больницы или ее сотрудника;

        public string PersonRole => Random.Shared.Next(2) == 0 ? "client" : "employee"; // роль(“Клиент” или “Сотрудник”);

        public int LastSecurityPointNumber => Random.Shared.Next(POINT_COUNT); // номер пункта СКУД, который был пройден последним;

        public string LastSecurityPointDirection => Random.Shared.Next(2) == 0 ? "in" : "out"; //направление прохода через пункт(“in” или “out”);

        public string LastSecurityPointTime => 
            new DateTime(DateTime.Now.Ticks - Random.Shared.NextInt64(DateTime.MinValue.AddMinutes(RANDOM_MINUTES_AGO).Ticks))
            .ToString("dd.MM.yyyy HH:mm");


    }
}
