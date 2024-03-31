# Rails Webhook Notification System

This Rails application demonstrates a simple webhook notification system without persistent storage. It captures data sent to its endpoints and forwards this information to configured third-party APIs via webhooks.

## Technologies Used

- **Ruby on Rails**: The web application framework used to build the application.
- **Webhook.site**: A third-party service utilized for testing webhook endpoints during development.


### Prerequisites

- Ruby (version "3.0.0")
- Rails (version "~> 7.1.3", ">= 7.1.3.2")

### Installation

1. Clone the repository to your local machine.

git clone <repository-url>

# Navigate to the application directory.
cd webhook_app
bundle install

# Set the environment variable for third-party API endpoints in your .env file

THIRD_PARTY_API_ENDPOINTS=https://webhook.site/d34a37af-5780-45a0-a480-d975c9617630

# Start the Rails server.

rails server

# endpoint use postman to hit these api endpoints

POST http://localhost:3000/notifications
PUT http://localhost:3000/notifications/5

# Testing Webhooks
We use Webhook.site to test webhook notifications.