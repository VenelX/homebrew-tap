cask "venelx" do
  version "0.1.1"
  sha256 "3a0a2b3977a785a7480913b30f782f7b5079f4c9dfbf72c1fa54ab354391b869"

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

  uninstall launchctl: "com.venelx.studio.engine",
            quit:      "com.venelx.studio"

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
