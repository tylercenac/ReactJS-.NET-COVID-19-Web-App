using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ibm.Br.Cic.Internship.Covid.Be.Models
{
    public class ApifyDataModel
    {
        [JsonProperty(PropertyName = "infected")]
        public string Infected { get; set; }

        [JsonProperty(PropertyName = "tested")]
        public string Tested { get; set; }

        [JsonProperty(PropertyName = "recovered")]
        public string Recovered { get; set; }

        [JsonProperty(PropertyName = "deceased")]
        public string Deceased { get; set; }

        [JsonProperty(PropertyName = "country")]
        public string Country { get; set; }

        [JsonProperty(PropertyName = "moreData")]
        public string MoreData { get; set; }

        [JsonProperty(PropertyName = "historyData")]
        public string HistoryData { get; set; }

        [JsonProperty(PropertyName = "sourceUrl")]
        public string SourceUrl { get; set; }

        [JsonProperty(PropertyName = "lastUpdatedSource")]
        public string LastUpdatedSource { get; set; }

        [JsonProperty(PropertyName = "lastUpdatedApify")]
        public string LastUpdatedApify { get; set; }

        [JsonProperty(PropertyName = "location")]
        public LocationDataModel? Location { get; set; }
    }
}
