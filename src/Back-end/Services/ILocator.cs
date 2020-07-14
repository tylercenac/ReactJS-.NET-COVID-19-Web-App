using Ibm.Br.Cic.Internship.Covid.Be.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ibm.Br.Cic.Internship.Covid.Be.Services
{
    public interface ILocator
    {
        LocationDataModel GetLocationApify(string country);
        LocationDataModel GetLocationCovid19Api(string country);
    }
}
