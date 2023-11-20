using FluentAssertions;
using Microsoft.Extensions.Options;
using Xtz.TicketlessFlowApp.Core;

namespace Xtz.TicketlessFlowApp.UnitTests
{
    public class CoreConnectService
    {
        public class GetState
        {
            [Fact]
            public void GetsState()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenEmptyConfig()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenWrongConfig()
            {
                // Arrange

                // Act

                // Assert
            }
        }

        public class GetConfig
        {
            [Fact]
            public void FetchesConfig()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenWrongInput()
            {
                // Arrange

                // Act

                // Assert
            }
        }

        public class FetchVenueData
        {
            [Fact]
            public void FetchesVenueData()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenNoVenue()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenEmptyInput()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenInvalidInput()
            {
                // Arrange

                // Act

                // Assert
            }
        }

        public class SyncEventTicketsData
        {
            [Fact]
            public void Syncs()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenWrongConfig()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenEventDoesntExist()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Syncs_WhenNoTickets()
            {
                // Arrange

                // Act

                // Assert
            }
        }

        public class FinalizeEvent
        {
            [Fact]
            public void FinalizesEvent()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenEmptyInput()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenInvalidInput()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenEventDoesntExist()
            {
                // Arrange

                // Act

                // Assert
            }

            [Fact]
            public void Fails_WhenEventAlreadyFinalized()
            {
                // Arrange

                // Act

                // Assert
            }
        }
    }
}