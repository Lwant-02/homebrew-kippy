cask "kippy" do
  version "1.0.1"
  sha256 "39c0d24a9abe6f7429e6a4d3f9bb744fc667726209c8353a78f91a99d83f2edf"

  url "https://github.com/Lwant-02/kippy-releases/releases/download/v#{version}/Kippy.dmg",
      verified: "github.com/Lwant-02/kippy-releases/"
  name "Kippy"
  desc "Capture layer: catch a thought from anywhere and get it back when it's useful"
  homepage "https://heykippy.app/"

  livecheck do
    url "https://heykippy.app/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Kippy.app"

  uninstall quit: "app.kippy.mac"

  # What was captured, ~/Library/Application Support/Kippy, is never zapped.
  zap trash: [
    "~/Library/Caches/app.kippy.mac",
    "~/Library/HTTPStorages/app.kippy.mac",
    "~/Library/Preferences/app.kippy.mac.plist",
    "~/Library/Saved Application State/app.kippy.mac.savedState",
  ]
end
