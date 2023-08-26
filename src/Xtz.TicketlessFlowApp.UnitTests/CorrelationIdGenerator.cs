using FluentAssertions;
using Microsoft.Extensions.Options;
using Xtz.TicketlessFlowApp.Core;

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

                var options = Options.Create(new CorrelationGeneratorOptions()
                {
                    Prefix = "TEST",
                });

                var sut = new Core.CorrelationIdGenerator(options);

                // Act

                var result = sut.Generate();

                // Assert

                result.Should().NotBeEmpty();
                result.Should().StartWith("TEST");
            }
        }
    }
}