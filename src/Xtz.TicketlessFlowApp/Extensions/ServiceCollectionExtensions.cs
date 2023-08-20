using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Xtz.TicketlessFlowApp.Core.Extensions;

namespace Xtz.TicketlessFlowApp.Extensions
{
    internal static class ServiceCollectionExtensions
    {
        public static IServiceCollection Setup(this IServiceCollection services, HostBuilderContext hostBuilderContext)
        {
            return services
                .UseCore(hostBuilderContext);
        }
    }
}
