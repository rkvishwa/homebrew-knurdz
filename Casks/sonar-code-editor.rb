cask "sonar-code-editor" do
  version "1.0.0-beta.2"
  sha256 :no_check

  url "https://github.com/rkvishwa/Sonar-Code-Editor/releases/download/v#{version}/Sonar.Code.Editor-#{version}-arm64.dmg"
  name "Sonar Code Editor"
  desc "IDE for monitored coding and collaboration"
  homepage "https://github.com/rkvishwa/Sonar-Code-Editor"

  # 1. This tells Homebrew NOT to apply the quarantine flag during download
  # This is the most important line for unsigned apps!
  container download_security: false

  app "Sonar Code Editor.app"

  # 2. This manually strips the attribute after installation
  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Sonar Code Editor.app"],
                   sudo: false
  end

  caveats <<~EOS
    If you still see a 'Damaged' error, run this command once:
    xattr -rd com.apple.quarantine /Applications/Sonar\\ Code\\ Editor.app
  EOS
end
