using ApiForSession2.Models;

namespace ApiForSession2.Data
{
    public class MockVisitorData
    {
        public static List<Visitor> GetVisitors()
        {
            var visitors = new List<Visitor>
            {
                new() { PersonCode = 1, PersonRole = "Сотрудник", LastSecurityPointNumber = 0, LastSecurityPointDirection = "in", LastSecurityPointTime = new DateTime(2024, 2, 4, 9,0,0) },
                new() { PersonCode = 1, PersonRole = "Сотрудник", LastSecurityPointNumber = 0, LastSecurityPointDirection = "out", LastSecurityPointTime = new DateTime(2024, 2, 4, 9, 30, 0) },
                new() { PersonCode = 2, PersonRole = "client", LastSecurityPointNumber = 0, LastSecurityPointDirection = "in", LastSecurityPointTime = new DateTime(2024, 2, 4, 9, 30, 0) },
                new() { PersonCode = 2, PersonRole = "client", LastSecurityPointNumber = 0, LastSecurityPointDirection = "out", LastSecurityPointTime = new DateTime(2024, 2, 4, 10, 0, 0) },
                new() { PersonCode = 3, PersonRole = "client", LastSecurityPointNumber = 3, LastSecurityPointDirection = "in", LastSecurityPointTime = new DateTime(2024, 2, 4, 10, 30, 0) },
                new() { PersonCode = 4, PersonRole = "client", LastSecurityPointNumber = 4, LastSecurityPointDirection = "in", LastSecurityPointTime = new DateTime(2024, 2, 4, 10, 30, 0) },
                new() { PersonCode = 3, PersonRole = "client", LastSecurityPointNumber = 3, LastSecurityPointDirection = "out", LastSecurityPointTime = new DateTime(2024, 2, 4, 10, 30, 0) },
                new() { PersonCode = 1, PersonRole = "Сотрудник", LastSecurityPointNumber = 22, LastSecurityPointDirection = "in", LastSecurityPointTime = new DateTime(2024, 2, 4, 9, 30, 0) },
            };

            return visitors;
        }
    }
}
