cask "screeny" do
  version "1.0.4"
  sha256 "2e270610c3099d55911327f3a0a95d9dfd5ccf381237b98dfb25eb001175272c"

  url "https://github.com/nilBora/Screeny/releases/download/v#{version}/Screeny-#{version}.dmg"
  name "Screeny"
  desc "A minimal macOS menu bar app for instant screenshot capture and annotation."
  homepage "https://github.com/nilBora/Screeny"

  depends_on macos: ">= :ventura"

  app "Screeny.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{appdir}/Screeny.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.screeny.app.plist",
    "~/Library/Caches/com.screeny.app",
  ]
end
