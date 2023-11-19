using System.Net;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Xtz.TicketlessFlowApp.Core;

namespace Xtz.TicketlessFlowApp.CheckSecret
{
    public class CheckSecretFunction
    {
        private readonly IOptions<CoreConnectOptions> _coreConnectOptions;

        private readonly ILogger _logger;

        public CheckSecretFunction(IOptions<CoreConnectOptions> coreConnectOptions, ILoggerFactory loggerFactory)
        {
            _coreConnectOptions = coreConnectOptions;
            _logger = loggerFactory.CreateLogger<CheckSecretFunction>();
        }

        [Function(nameof(CheckSecretFunction))]
        public HttpResponseData Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "check-secret")] HttpRequestData req)
        {
            _logger.LogInformation("C# HTTP trigger function processed a request.");

            var response = req.CreateResponse(HttpStatusCode.OK);
            response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

            response.WriteString($"Secret is: '{_coreConnectOptions.Value.ApiKey}'");

            return response;
        }
    }
}
