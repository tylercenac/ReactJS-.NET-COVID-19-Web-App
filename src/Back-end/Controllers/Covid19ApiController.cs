using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Ibm.Br.Cic.Internship.Covid.Be.Services;

namespace Ibm.Br.Cic.Internship.Covid.Be.Controllers
{    
    [ApiController]
    [Route("api/v2/c19api")]
    [Produces("application/json")]    
    public class Covid19ApiController : Controller
    {
        //Task: Implement API
        private readonly ICovid19Api _covid19Api;
        public Covid19ApiController(ICovid19Api covid19Api)
        {
            this._covid19Api = covid19Api;
        }

        [HttpGet]
        [ResponseCache(Duration = 120, Location = ResponseCacheLocation.Any)]
        public async Task<IActionResult> Get()
        {
            var result = await this._covid19Api.GetDataAsync();
            return Ok(result);
        }

    }
}