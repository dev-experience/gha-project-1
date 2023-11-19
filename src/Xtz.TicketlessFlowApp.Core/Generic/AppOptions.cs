namespace Xtz.TicketlessFlowApp.Core.Generic;

public class AppOptions
{
    public string Environment { get; set; }

    public DateTime BuildTimestamp { get; set; }

    public string GithubSha { get; set; }
}