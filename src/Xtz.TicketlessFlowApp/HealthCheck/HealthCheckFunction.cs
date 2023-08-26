using System.Net;
using System.Text.Json.Serialization;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;
using Xtz.TicketlessFlowApp.Core;

namespace Xtz.TicketlessFlowApp.HealthCheck
{
    public class HealthCheckFunction
    {
        private readonly ICorrelationIdGenerator _correlationIdGenerator;

        private readonly ILogger _logger;

        public HealthCheckFunction(ICorrelationIdGenerator correlationIdGenerator, ILoggerFactory loggerFactory)
        {
            _correlationIdGenerator = correlationIdGenerator;
            _logger = loggerFactory.CreateLogger<HealthCheckFunction>();
        }

        [Function(nameof(HealthCheckFunction))]
        public async Task<HttpResponseData> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "health")] HttpRequestData req)
        {
            _logger.LogInformation("Processing health check request");

            var dto = new HealthCheckDto
            {
                Status = "OK",
                CorrelationId = _correlationIdGenerator.Generate(),
            };

            var response = req.CreateResponse(HttpStatusCode.OK);
            await response.WriteAsJsonAsync(dto);
            return response;
        }

        public class HealthCheckDto
        {
            [JsonPropertyName("status")]
            public string? Status { get; init; }

            [JsonPropertyName("correlationId")]
            public string CorrelationId { get; init; }
        }
    }
}
