cask "meeting-reminder" do
  version "1.1.6"
  sha256 "7d3af4e8f4034ae5bf939b6d4c23e0be986cce3121a2921ee1183ad033c7e24c"

  url "https://github.com/nilBora/meeting-reminder/releases/download/v#{version}/MeetingReminder-#{version}.dmg"
  name "Meeting Reminder"
  desc "Native macOS menu bar meeting reminder with full-screen overlay"
  homepage "https://github.com/nilBora/meeting-reminder"

  depends_on macos: ">= :ventura"

  app "MeetingReminder.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{appdir}/MeetingReminder.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.meetingreminder.app.plist",
    "~/Library/Caches/com.meetingreminder.app",
  ]
end
