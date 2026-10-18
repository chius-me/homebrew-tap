cask "favicon-fisher" do
  version "1.6.0"
  sha256 "224a117bdc70de22bdfa190e9842afa418ea1c87e6bfa7fee0e28451b7252e1d"

  url "https://github.com/chius-me/favicon-fisher/releases/download/v#{version}/Favicon-Fisher-#{version}-universal.dmg"
  name "Favicon Fisher"
  desc "Discover and save website icons from the menu bar"
  homepage "https://github.com/chius-me/favicon-fisher"

  depends_on macos: :sonoma

  app "Favicon Fisher.app"

  uninstall quit: "dev.chius.favicon-fisher"

  zap trash: [
    "~/Library/Caches/dev.chius.favicon-fisher",
    "~/Library/Preferences/dev.chius.favicon-fisher.plist",
  ]

  caveats <<~EOS
    This build is ad-hoc signed and is not notarized by Apple.
    If macOS blocks the first launch, review the app's source and use
    System Settings > Privacy & Security > Open Anyway to allow this app.
  EOS
end
