cask "kippy" do
  version "1.1.0"
  sha256 "48598c82d9ae64ebc6d42a3110efe5225f7d61ecdfaa0faee6e7b8e9c2186607"

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
