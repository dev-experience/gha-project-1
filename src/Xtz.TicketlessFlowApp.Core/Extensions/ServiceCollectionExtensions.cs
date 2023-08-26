using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Xtz.TicketlessFlowApp.Core.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection UseCore(
        this IServiceCollection services,
        HostBuilderContext hostBuilderContext)
    {
        services.AddSingleton<ICorrelationIdGenerator, CorrelationIdGenerator>();

        services.AddOptions<CorrelationGeneratorOptions>()
            .BindConfiguration("CorrelationGenerator")
            .ValidateDataAnnotations()
            .ValidateOnStart();

        return services;
    }
}
