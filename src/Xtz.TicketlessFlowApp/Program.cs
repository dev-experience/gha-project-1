using System.Reflection;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using Xtz.TicketlessFlowApp.Extensions;

namespace Xtz.TicketlessFlowApp
{
    public partial class Program
    {
        public static void Main()
        {
            var host = new HostBuilder()
                .ConfigureServices((context, services) => { services.Setup(context); })
                .ConfigureFunctionsWorkerDefaults()
                .Build();

            host.Run();
        }
    }
}