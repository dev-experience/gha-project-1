using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Xtz.TicketlessFlowApp.Extensions;

namespace Xtz.TicketlessFlowApp
{
    public class Program
    {
        public static void Main()
        {
            var host = new HostBuilder()
                .ConfigureAppConfiguration((context, builder) =>
                {
                    builder.AddEnvironmentVariables("XTZ_");
                })
                .ConfigureServices((context, services) => services.Setup(context))
                .ConfigureFunctionsWorkerDefaults()
                .Build();

            host.Run();
        }
    }
}