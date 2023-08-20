using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Xtz.TicketlessFlowApp.HealthCheck;

namespace Xtz.TicketlessFlowApp.Core.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection UseCore(
            this IServiceCollection services,
            HostBuilderContext hostBuilderContext)
        {
            services.AddSingleton<ICorrelationIdGenerator, CorrelationIdGenerator>();

            return services;
        }
    }
}
