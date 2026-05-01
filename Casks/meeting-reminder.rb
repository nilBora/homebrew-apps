cask "meeting-reminder" do
  version "1.1.4"
  sha256 "d4411a62da587fc97c474230068a36585ba6b5ac7be8f7d2156a98c453eec6a9"

  url "https://github.com/nilBora/meeting-reminder/releases/download/v#{version}/MeetingReminder-#{version}.dmg"
  name "Meeting Reminder"
  desc "Native macOS menu bar meeting reminder with full-screen overlay"
  homepage "https://github.com/nilBora/meeting-reminder"

  depends_on macos: ">= :ventura"

  app "MeetingReminder.app"

  caveats <<~EOS
    #{appdir}/MeetingReminder.app is not signed by Apple.
    If macOS blocks the app, re-install with:
      brew install --cask --no-quarantine meeting-reminder
    Or right-click the app in Finder → Open the first time.
  EOS

  zap trash: [
    "~/Library/Preferences/com.meetingreminder.app.plist",
    "~/Library/Caches/com.meetingreminder.app",
  ]
end
