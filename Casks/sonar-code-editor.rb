cask "sonar-code-editor" do
  version "1.0.0-beta.2"
  sha256 :no_check

  url "https://github.com/rkvishwa/Sonar-Code-Editor/releases/download/v#{version}/Sonar.Code.Editor-#{version}-arm64.dmg"
  name "Sonar Code Editor"
  desc "IDE for monitored coding and collaboration"
  homepage "https://github.com/rkvishwa/Sonar-Code-Editor"

  # The exact name of the .app file inside your DMG
  app "Sonar Code Editor.app"

  # This runs as soon as the DMG is downloaded
  preflight do
    system_command "xattr", args: ["-d", "com.apple.quarantine", "#{staged_path}/Sonar.Code.Editor-#{version}-arm64.dmg"], sudo: false rescue nil
  end

  # This runs after the .app is moved to /Applications
  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Sonar Code Editor.app"],
                   sudo: false
  end

  caveats <<~EOS
    If you see a 'Damaged' error on first launch, run:
    xattr -cr /Applications/"Sonar Code Editor.app"
  EOS
end
