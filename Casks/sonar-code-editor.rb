cask "sonar-code-editor" do
  version "1.0.0-beta.4"
  sha256 :no_check

  url "https://github.com/rkvishwa/Sonar-Code-Editor/releases/download/v#{version}/Sonar.Code.Editor-#{version}-arm64.dmg"
  name "Sonar Code Editor"
  desc "IDE for monitored coding and collaboration"
  homepage "https://github.com/rkvishwa/Sonar-Code-Editor"

  # Ensure this matches the app name inside the DMG exactly
  app "Sonar Code Editor.app"

  # This runs AFTER the app is moved to /Applications
  # It targets the app exactly where Homebrew puts it
  postflight do
    # The 'system_command' is the official Homebrew way to run terminal commands
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Sonar Code Editor.app"],
                   sudo: false
  rescue
    # If the app isn't found or xattr fails, it won't crash the installation
    nil
  end

  caveats <<~EOS
    If you see a 'Damaged' error on first launch, it is a macOS security false-positive.
    Fix it by running this in your terminal:
    xattr -cr /Applications/"Sonar Code Editor.app"
  EOS
end
