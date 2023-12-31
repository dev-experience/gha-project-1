using System.Net;
using System.Text.Json.Serialization;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Xtz.TicketlessFlowApp.Core;
using Xtz.TicketlessFlowApp.Core.Generic;

namespace Xtz.TicketlessFlowApp.HealthCheck
{
    public class HealthCheckFunction
    {
        private readonly ICorrelationIdGenerator _correlationIdGenerator;

        private readonly IOptions<AppOptions> _appOptions;

        private readonly ILogger _logger;

        public HealthCheckFunction(ICorrelationIdGenerator correlationIdGenerator, IOptions<AppOptions> appOptions, ILoggerFactory loggerFactory)
        {
            _correlationIdGenerator = correlationIdGenerator;
            _appOptions = appOptions;
            _logger = loggerFactory.CreateLogger<HealthCheckFunction>();
        }

        [Function(nameof(HealthCheckFunction))]
        public async Task<HttpResponseData> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "health")] HttpRequestData req)
        {
            _logger.LogInformation("Processing health check request");

            var dto = new HealthCheckDto
            {
                Status = "OK",
                Environment = _appOptions.Value.Environment,
                ImageTimestamp = _appOptions.Value.ImageTimestamp,
                GitCommitSha = _appOptions.Value.GitCommitSha,
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
            public string? CorrelationId { get; init; }

            [JsonPropertyName("environment")]
            public string? Environment { get; set; }

            [JsonPropertyName("imageTimestamp")]
            public string? ImageTimestamp { get; set; }

            [JsonPropertyName("gitCommitSha")]
            public string? GitCommitSha { get; set; }
        }
    }
}
