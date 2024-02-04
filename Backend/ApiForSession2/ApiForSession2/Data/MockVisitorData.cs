using ApiForSession2.Models;

namespace ApiForSession2.Data
{
    public class MockVisitorData
    {
        public static List<Visitor> GetVisitors()
        {
            var visitors = new List<Visitor>
            {
                // Add more mock data here
                new Visitor { PersonCode = "123", PersonRole = "Сотрудник", LastSecurityPointNumber = 0, LastSecurityPointDirection = "in", LastSecurityPointTime = new DateTime(2023, 1, 1, 8, 30, 0) },
                new Visitor { PersonCode = "456", PersonRole = "Клиент", LastSecurityPointNumber = 1, LastSecurityPointDirection = "out", LastSecurityPointTime = new DateTime(2023, 1, 1, 9, 0, 0) },
                // Add more mock data here
            };

            for (int i = 0; i < 22; i++)
            {
                visitors.Add(new Visitor { PersonCode = $"789{i}", PersonRole = i % 2 == 0 ? "Сотрудник" : "Клиент", LastSecurityPointNumber = i, LastSecurityPointDirection = "in", LastSecurityPointTime = new DateTime(2023, 1, 1, 8, 30, 0) });
                visitors.Add(new Visitor { PersonCode = $"789{i}", PersonRole = i % 2 == 0 ? "Сотрудник" : "Клиент", LastSecurityPointNumber = i, LastSecurityPointDirection = "out", LastSecurityPointTime = new DateTime(2023, 1, 1, 9, 0, 0) });
            }

            return visitors;
        }
    }
}
