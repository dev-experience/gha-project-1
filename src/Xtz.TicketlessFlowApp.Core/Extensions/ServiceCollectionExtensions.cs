using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Xtz.TicketlessFlowApp.Core.Generic;

namespace Xtz.TicketlessFlowApp.Core.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection UseCore(
        this IServiceCollection services,
        HostBuilderContext hostBuilderContext)
    {
        return services
            .AddSingleton<ICorrelationIdGenerator, CorrelationIdGenerator>()
            .AddXtzConfigSection<CorrelationGeneratorOptions>("CorrelationGenerator")
            .AddXtzConfigSection<CoreConnectOptions>("CoreConnect");
    }
}
