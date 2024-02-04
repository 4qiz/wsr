using ApiForSession2.Data;
using ApiForSession2.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ApiForSession2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValueVisitorController : ControllerBase
    {
        private static List<Visitor> visitors = MockVisitorData.GetVisitors();

        [HttpGet]
        public ActionResult<IEnumerable<Visitor>> GetVisitors()
        {
            return Ok(visitors);
        }
    }
}
