# PostToLinkedIn

This repository contains PowerShell scripts and instructions for creating an Azure Function that automatically posts images as LinkedIn posts.

## Prerequisites

Before you can use the scripts in this repository, you need to create a LinkedIn app and obtain the necessary credentials. Follow these steps:

1. Go to the [LinkedIn Developers portal](https://www.linkedin.com/developers/) and sign in with your LinkedIn account.
2. Click "Create app" and fill in the required information.
3. After creating the app, go to the "Auth" tab and note down the "Client ID" and "Client Secret."
4. In the same tab, add the necessary redirect URI for your app. This URI will be used to receive the authorization code during the OAuth 2.0 flow.

## Directory Structure
```
PostToLinkedIn/
│
├─ PostImageFunction/
│   ├─ function.json
│   └─ run.ps1
│
└─ README.md
`

- `PostImageFunction/`: This folder contains the Azure Function code and configuration.
  - `function.json`: This file defines the function's bindings and settings, including the Timer trigger configuration.
  - `run.ps1`: This PowerShell script contains the code that will be executed by the Azure Function.
- `README.md`: This file provides instructions and information about the project.

## Setting Up the Azure Function

Follow these steps to set up a Timer-triggered Azure Function using the provided PowerShell script:

1. Create an Azure Functions App in the Azure portal. Make sure to select "PowerShell Core" as the runtime stack.
2. Create a Timer-triggered Function with a daily schedule (use the CRON expression `0 0 * * *`).
3. Use the provided `run.ps1` and `function.json` files from the `PostImageFunction` folder for your Azure Function.
4. Store the "Client ID," "Client Secret," and "Redirect URI" in the Function App's "Configuration" section as environment variables or use Azure Key Vault to securely store them.

## Obtaining the Access Token

1. Use the `Generate-LinkedInAuthUrl.ps1` script to create the LinkedIn authorization URL. Replace `YOUR_APP_CLIENT_ID` and `YOUR_REDIRECT_URI` with your app's client ID and redirect URI.
2. Navigate to the generated authorization URL in your web browser, log in, and grant the required permissions.
3. Copy the `code` parameter from the redirected URL.
4. Use the provided PowerShell script to exchange the authorization code for an access token. Store the access token securely in the Function App's "Configuration" section or use Azure Key Vault.

## Posting Images to LinkedIn

The `run.ps1` script in the `PostImageFunction` folder is designed to post images as LinkedIn posts. Update the script to include the logic for fetching the desired images or use a predefined list of image URLs.

To post an image, you need to use LinkedIn's API to upload the image first, and then use the returned asset URN to create the post. The provided `run.ps1` script demonstrates how to do this.

## Setting Up Continuous Deployment (Optional)

To automatically deploy changes from a GitHub repository to your Azure Function, follow these steps:

1. Prepare your GitHub repository, ensuring that it contains the `run.ps1` and `function.json` files in a folder named after your function (e.g., `PostImageFunction`).
2. In the Azure portal, go to your Function App, and click "Deployment Center" under the "Deployment" section.
3. Choose "GitHub" as your source control provider and
