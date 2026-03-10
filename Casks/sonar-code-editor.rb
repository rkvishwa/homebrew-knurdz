cask "sonar-code-editor" do
  version "1.0.0-beta.2"
  sha256 :no_check

  url "https://github.com/rkvishwa/Sonar-Code-Editor/releases/download/v1.0.0-beta.2/Sonar.Code.Editor-1.0.0-beta.2-arm64.dmg"
  name "Sonar Code Editor"
  desc "IDE for monitored coding and collaboration"
  homepage "https://github.com/rkvishwa/Sonar-Code-Editor"

  app "Sonar Code Editor.app"

  # This is the important part for your users:
  caveats <<~EOS
    #{token} is not signed by Apple. To open it the first time:
    1. Open your Applications folder.
    2. Right-click #{token}.app and select 'Open'.
    3. Click 'Open' again on the warning dialog.
  EOS
end
