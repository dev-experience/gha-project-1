namespace Xtz.TicketlessFlowApp.HealthCheck
{
    public class CorrelationIdGenerator : ICorrelationIdGenerator
    {
        public Guid Generate() => Guid.NewGuid();
    }
}