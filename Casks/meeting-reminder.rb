cask "meeting-reminder" do
  version "1.1.8"
  sha256 "1b61602f5910abfa16cf2e2290b24071102d29c35ed98abc5f5d255b81ce31de"

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
