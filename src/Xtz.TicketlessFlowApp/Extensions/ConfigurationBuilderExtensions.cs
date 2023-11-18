using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Azure.Identity;
using Microsoft.Extensions.Configuration;

namespace Xtz.TicketlessFlowApp.Extensions
{
    public static class ConfigurationBuilderExtensions
    {
        public static IConfigurationBuilder ConfigureKeyVault(this IConfigurationBuilder builder)
        {
            Console.WriteLine("Reading Key Vault URI from environment variable 'XTZ_KeyVaultUri'");
            var keyVaultUriEnvironmentVariable = Environment.GetEnvironmentVariable("XTZ_KeyVaultUri");
            if (!string.IsNullOrWhiteSpace(keyVaultUriEnvironmentVariable))
            {
                Console.WriteLine($"XTZ_KeyVaultUri = '{keyVaultUriEnvironmentVariable}'");

                if (!Uri.TryCreate(keyVaultUriEnvironmentVariable, UriKind.Absolute, out var keyVaultUri)) throw new Exception("Environment variable 'XTZ_KeyVaultUri' is a valid URI");

                Console.WriteLine("Configuring Azure Key Vault...");
                builder.AddAzureKeyVault(keyVaultUri, new DefaultAzureCredential());
            }
            else
            {
                Console.WriteLine("'XTZ_KeyVaultUri' doesn't contain a value");
            }

            return builder;
        }
    }
}
