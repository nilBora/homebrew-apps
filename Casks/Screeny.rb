cask "Screeny" do
  version "1.0.3"
  sha256 "0108595cb0207b6b197c1646bd213e3a798d133f4baa8b195628b53d4d387708"

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
    "~/Library/Preferences/com.Screeny.app.plist",
    "~/Library/Caches/com.Screeny.app",
  ]
end
