# News App - Flutter & Riverpod

This is a **Flutter-based News App** built using the **Riverpod** state management library. The app fetches news articles from a public API and displays them in a paginated list, handling various states like loading, data, and error. The app demonstrates clean architecture principles using repositories, providers, and network services.

## Features

- **State Management with Riverpod**: Efficient state management to manage news articles, loading states, and errors.
- **News API Integration**: Fetches news data from a REST API (e.g., NewsAPI.org) and displays articles in a list format.
- **Pagination**: Fetches news in pages, automatically loading more articles as the user scrolls down.
- **Error Handling**: Gracefully handles errors such as network issues, providing feedback to the user and retry mechanisms.
- **Loading Indicators**: Shows a loading spinner while fetching data, both for the initial load and while loading additional pages.
