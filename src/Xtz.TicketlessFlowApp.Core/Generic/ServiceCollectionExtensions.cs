using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Xtz.TicketlessFlowApp.Core.Generic;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddXtzConfigSection<TOptions>(this IServiceCollection services, string sectionBaseName)
        where TOptions : class
    {
        services.AddOptions<TOptions>()
            .BindConfiguration($"XTZ_{sectionBaseName}")
            .ValidateDataAnnotations()
            .ValidateOnStart();

        return services;
    }
}
