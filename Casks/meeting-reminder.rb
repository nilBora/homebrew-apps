cask "meeting-reminder" do
  version "1.1.7"
  sha256 "66e27451ea85ab71eb11883f2139043112b6940bf8df7b773bdc020d3834f35e"

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
