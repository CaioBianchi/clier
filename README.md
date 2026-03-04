# 💻 CLIer

[![CI Status](https://github.com/CaioBianchi/clier/actions/workflows/ci.yml/badge.svg)](https://github.com/CaioBianchi/clier/actions/workflows/ci.yml)
[![Ruby Version](https://img.shields.io/badge/Ruby-4.0+-red.svg)](https://www.ruby-lang.org/)
[![Rails Version](https://img.shields.io/badge/Rails-8.1+-CC0000.svg)](https://rubyonrails.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

CLIer is a curated, elegant directory of the most popular and powerful Command Line Interface (CLI) tools, TUIs, frameworks, and utilities. Discover new tools to boost your terminal productivity, keep track of your favorites, and get quick access to their installation instructions and documentation.

## ✨ Features

- **Extensive Catalog**: Browse through ~150 of the most popular CLI tools, beautifully presented with OpenGraph previews.
- **Search & Filter**: Instantly search for tools by name or description, and filter by categories like "Web Framework", "Version Manager", "TUI", etc.
- **Auto-Updating Data**: A built-in background job periodically checks the GitHub API to ensure version numbers, stars, and READMEs are always up-to-date.
- **Seamless UX**: Infinite scrolling powered by Hotwire (Turbo Streams) ensures a smooth browsing experience without page reloads.
- **Dark Mode**: Fully supports automatic light/dark mode switching based on your system preferences using Tailwind CSS.
- **Favoriting System**: Create an account to bookmark your favorite tools and build your personalized CLI toolkit.
- **Quick Previews**: Click any tool to open a quick-view modal containing its fully rendered GitHub README and quick install commands.

## 🛠 Tech Stack

- **Framework**: Ruby on Rails 8.1
- **Database**: PostgreSQL
- **Frontend**: Tailwind CSS v4, Hotwire (Turbo & Stimulus)
- **Background Jobs**: Solid Queue (Rails 8 default)
- **Authentication**: Rails 8 built-in authentication system
- **API Integrations**: GitHub REST API (fetching stats, versions, and markdown rendering)

## 🚀 Getting Started

### Prerequisites
- Ruby 4.0+
- PostgreSQL
- GitHub CLI (`gh`) - *Optional, but recommended for API rate limits*

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/CaioBianchi/clier.git
   cd clier
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Setup the database and run migrations:
   ```bash
   bin/rails db:setup
   ```

4. Populate the database with the initial seeds:
   ```bash
   bin/rails db:seed
   ```

5. (Optional) Run the local script to fetch the latest GitHub data immediately:
   ```bash
   # Make sure you are authenticated with `gh auth login` for higher rate limits
   bin/rails runner "UpdateToolsJob.perform_now"
   ```

6. Start the development server:
   ```bash
   bin/dev
   ```

7. Visit `http://localhost:3000` in your browser!

## 🧪 Testing

The application includes a comprehensive test suite written in Minitest, utilizing WebMock to safely stub external API calls to GitHub.

To run the tests:
```bash
bin/rails test
```

## 📦 Deployment

This application is production-ready and configured for SSL. It includes predefined settings for:
- **Sentry**: For APM and Error Tracking
- **Google Analytics**: For basic traffic analytics
- **Solid Queue**: Scheduled jobs configured in `config/recurring.yml`

Recommended deployment is via **Kamal** (configuration available in `.kamal/`).

## 📄 License
This project is open-source and available under the MIT License.
