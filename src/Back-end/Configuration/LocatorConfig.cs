using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ibm.Br.Cic.Internship.Covid.Be.Configuration
{
    public class LocatorConfig : IFileConfig
    {
        public override string Path
        {
            get { return this._path; }
            set { this._path = value; }
        }
    }
}
