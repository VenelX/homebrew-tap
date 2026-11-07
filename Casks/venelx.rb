cask "venelx" do
  version "0.1.2"
  sha256 "a21169a09c8e0ce8895a0a1c38414ff8c69ebbc0b5cfdb5981e2fd7d84142092"

  url "https://github.com/VenelX/homebrew-tap/releases/download/v#{version}/VenelX-Studio-#{version}.dmg"
  name "VenelX Studio"
  desc "Turns your computer into a team's mobile release machine"
  homepage "https://studio.venelx.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "VenelX Studio.app"

  # The engine is a per-user LaunchAgent the app writes and restarts itself (see the app's EngineAgent). Stop only
  # that user agent here: `launchctl:` would also look in the system domain and ask for a password.
  uninstall quit:   "com.venelx.studio",
            script: {
              executable:   "/bin/launchctl",
              args:         ["bootout", "gui/#{Process.uid}/com.venelx.studio.engine"],
              must_succeed: false,
            },
            trash:  "~/Library/LaunchAgents/com.venelx.studio.engine.plist"

  zap trash: [
    "~/Library/Application Support/VenelX Studio",
    "~/Library/Caches/com.venelx.studio",
    "~/Library/HTTPStorages/com.venelx.studio",
    "~/Library/Preferences/com.venelx.studio.plist",
  ]

  caveats <<~EOS
    VenelX Studio beta builds aren't notarized by Apple yet. The first time you open it, macOS says it
    can't check the app: open System Settings › Privacy & Security and click "Open Anyway".
  EOS
end
