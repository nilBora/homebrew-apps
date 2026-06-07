cask "screeny" do
  version "1.0.5"
  sha256 "43000ba70d94ab3b588dce6e6c36c2d0bd8a8f6b01e571c07d7a354597229f59"

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
