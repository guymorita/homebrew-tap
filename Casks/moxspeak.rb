cask "moxspeak" do
  version "0.7.0"
  sha256 "48e9b1d2c7478a50ba03a34e84cc163de13d4b4ec9aa8b67bf1fe591a0a6893c"

  url "https://github.com/guymorita/moxspeak/releases/download/v#{version}/MoxSpeak.dmg"
  name "MoxSpeak"
  desc "Select text anywhere and hear it read aloud, with the voice model running locally"
  homepage "https://guymorita.github.io/moxspeak/"

  # MLX is Apple silicon only, so there is no Intel build and never will be. Saying so
  # here means `brew install` refuses with a clear reason instead of installing an app
  # that cannot launch.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MoxSpeak.app"

  # MoxSpeak keeps its state in exactly two places outside the bundle. Both are listed so
  # `brew uninstall --zap` really does leave nothing behind, which is the promise the
  # command makes.
  zap trash: [
    "~/Library/Preferences/com.moxspeak.menubar.plist",
    "~/Library/Logs/MoxSpeak.log",
  ]
end
