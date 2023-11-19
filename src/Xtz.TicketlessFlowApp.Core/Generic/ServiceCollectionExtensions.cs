using System.Reflection;
using Microsoft.Extensions.DependencyInjection;

namespace Xtz.TicketlessFlowApp.Core.Generic;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddAppOptions(this IServiceCollection services)
    {
        services
            .AddOptions<AppOptions>()
            .Configure(x =>
            {
                x.Environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
                x.BuildTimestamp = File.GetCreationTime(Assembly.GetExecutingAssembly().Location).ToUniversalTime();
                x.GithubSha = Environment.GetEnvironmentVariable("GITHUB_SHA");
            });

        return services;
    }

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
