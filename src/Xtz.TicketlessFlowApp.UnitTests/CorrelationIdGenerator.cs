using FluentAssertions;

namespace Xtz.TicketlessFlowApp.UnitTests
{
    public class CorrelationIdGenerator
    {
        public class Generate
        {
            [Fact]
            public void ReturnsGuid()
            {
                // Arrange

                var sut = new HealthCheck.CorrelationIdGenerator();

                // Act

                var result = sut.Generate();

                // Assert

                result.Should().NotBeEmpty();
            }
        }
    }
}