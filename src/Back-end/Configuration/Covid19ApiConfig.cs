using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ibm.Br.Cic.Internship.Covid.Be.Configuration
{
    public class Covid19ApiConfig : IUrlConfig
    {
        public override string BaseUrl
        {
            get { return this._baseUrl; }
            set { this._baseUrl = value; }
        }
        public override string RequestUrl
        {
            get { return this._requestUrl; }
            set { this._requestUrl = value; }
        }
    }
}
