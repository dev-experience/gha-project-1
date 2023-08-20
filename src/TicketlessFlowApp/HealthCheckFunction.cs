using System.Net;
using System.Text.Json.Serialization;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;

namespace TicketlessFlowApp
{
    public class HealthCheckFunction
    {
        private readonly ILogger _logger;

        public HealthCheckFunction(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger<HealthCheckFunction>();
        }

        [Function(nameof(HealthCheckFunction))]
        public HttpResponseData Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "health")] HttpRequestData req)
        {
            _logger.LogInformation("Processing health check request");

            var response = req.CreateResponse(HttpStatusCode.OK);
            //response.Headers.Add("Content-Type", "application/json; charset=utf-8");
            response.WriteAsJsonAsync(new HealthCheckDto{ Status = "OK" });
            return response;
        }

        public class HealthCheckDto
        {
            [JsonPropertyName("status")]
            public string Status { get; init; }
        }
    }
}
