# Morbotron API root
$morbotron = "https://morbotron.com/api"

# Rick and Morty API root
$rickAndMorty = "https://masterofallscience.com/api"

# Simpsons API root
$simpsons = "https://frinkiac.com/api"

Function Get-Futurama {
    Invoke-QuoteRequest("$morbotron/random")
}

Function Get-RickAndMorty {
    Invoke-QuoteRequest("$rickAndMorty/random")
}

Function Get-Simpsons {
    Invoke-QuoteRequest("$simpsons/random")
}

# Helper function to invoke endpoint and write results
Function Invoke-QuoteRequest($endpoint) {
    $result = Invoke-RestMethod -Uri $endpoint
    Write-PrettyResult($result)
}

# Helper function to write out formatted results
Function Write-PrettyResult($result) {
    $episode = $result.Episode
    $title = $episode.Title
    $season = $episode.Season
    $episodeNum = $episode.EpisodeNumber

    # Display the episode title
    Write-Host "`n`"$title`" " -ForegroundColor "green"

    # Display the season # and episode #
    Write-Host "Season $season / Episode $episodeNum `n" -ForegroundColor "magenta"
    
    # Quote is the content from each subtitle
    foreach ($subtitle in $result.Subtitles) {
        Write-Host $subtitle.Content
    }

    # Newline for formatting
    Write-Host
}