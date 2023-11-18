using Azure.Identity;
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
                    builder.ConfigureKeyVault();

                    // TODO: Check if required
                    //builder.AddEnvironmentVariables("XTZ_");
                })
                .ConfigureFunctionsWorkerDefaults()
                .ConfigureServices((context, services) => services.Setup(context))
                .Build();

            host.Run();
        }
    }
}