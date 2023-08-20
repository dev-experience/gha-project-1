namespace Xtz.TicketlessFlowApp.HealthCheck;

public interface ICorrelationIdGenerator
{
    Guid Generate();
}