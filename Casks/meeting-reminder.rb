cask "meeting-reminder" do
  version "1.1.5"
  sha256 "361140556da82e5138ef271a18d8c7425aa87389d8fffde666945b65cb4d678d"

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
