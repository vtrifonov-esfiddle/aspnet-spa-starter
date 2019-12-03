function WatchedTestReact() {
    docker exec -it react-container.dev npm test --prefix /app/ClientApp
}

WatchedTestReact