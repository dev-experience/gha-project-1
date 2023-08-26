using Microsoft.Extensions.Options;

namespace Xtz.TicketlessFlowApp.Core;

public class CorrelationIdGenerator : ICorrelationIdGenerator
{
    private readonly IOptions<CorrelationGeneratorOptions> _options;

    public CorrelationIdGenerator(IOptions<CorrelationGeneratorOptions> options)
    {
        _options = options;
    }

    public string Generate()
    {
        var result = $"{_options.Value.Prefix}_{Guid.NewGuid():D}";
        return result;
    }
}
