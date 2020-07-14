using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ibm.Br.Cic.Internship.Covid.Be.Configuration
{
    public abstract class IUrlConfig
    {
        protected string _baseUrl = string.Empty;
        protected string _requestUrl = string.Empty;

        public abstract string BaseUrl { get; set; }

        public abstract string RequestUrl { get; set; }
    }
}
