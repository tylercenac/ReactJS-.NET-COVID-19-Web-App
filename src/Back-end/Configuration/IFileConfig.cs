using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ibm.Br.Cic.Internship.Covid.Be.Configuration
{
    public abstract class IFileConfig
    {
        protected string _path = string.Empty;
        public abstract string Path
        {
            get; set;
        }
    }
}
