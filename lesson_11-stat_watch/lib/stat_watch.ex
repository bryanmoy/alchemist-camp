defmodule StatWatch do
  alias StatWatch.Repo
  alias StatWatch.Profile

  def run do
    for profile <- Repo.all(Profile) do
      fetch_stats(profile)
      |> save_csv(profile.name)
    end
  end

  def column_names() do
    Enum.join(~w(DateTime Subscribers Videos Views), ",")
  end

  def fetch_stats() do
    now = DateTime.to_string(%{DateTime.utc_now() | microsecond: {0, 0}})

    %{body: body} = HTTPoison.get!(stats_url())
    %{items: [%{statistics: stats} | _]} = Poison.decode!(body, keys: :atoms)

    [now, stats.subscriberCount, stats.videoCount, stats.viewCount] |> Enum.join(",e")
  end

  def save_csv(row_of_stats) do
    filename = "stats.csv"

    unless File.exists?(filename) do
      File.write!(filename, column_names() <> "\n")
    end

    File.write!(filename, row_of_stats <> "\n", [:append])
  end

  def stats_url() do
    youtube_api_v3 = "https://www.googleapis.com/youtube/v3/"
    channel = "id=" <> "UCpG1gFr0tM55OYK3J843Uqw"
    key = "key=" <> "AIzaSyDTdFqoYfrghTlYswMrRjvT33Rm1E45v5c"
    "#{youtube_api_v3}channels?#{channel}&#{key}&part=statistics"
  end
end
