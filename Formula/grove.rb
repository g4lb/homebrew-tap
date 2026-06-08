# Bump `version` and the four `sha256` values on each grove release
# (the release workflow prints them in SHASUMS256.txt).
class Grove < Formula
  desc "Orchestrates AI-driven development in isolated environments"
  homepage "https://github.com/g4lb/grove"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-arm64"
      sha256 "f8367fb69ccf0a30cf4e15024ec5522fdae51303ac9bf6e01227760faddaf105"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-x64"
      sha256 "20019ab5fab569ff91df0ecba1cf39dde7b8ee8392dabf45445a06733587a621"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-arm64"
      sha256 "6aec3a91c56c6cc625f479ec57b0d1b1d9d5443e328f417a104fef4a68f57d16"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-x64"
      sha256 "edc81a8ad987e64fed58b0a60af3095965a76baeaa8cd0b5ddbb68d5d48228b1"
    end
  end

  def install
    bin.install Dir["grove-*"].first => "grove"
  end

  def caveats
    <<~EOS
      grove needs its claude runtime. Finish setup with:
        grove install-runtime
    EOS
  end

  test do
    # The release bumps `version` and grove's VERSION together, so the binary
    # reports the formula version — assert against it, not a literal.
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
