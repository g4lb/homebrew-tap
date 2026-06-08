# Bump `version` and the four `sha256` values on each grove release
# (the release workflow prints them in SHASUMS256.txt).
class Grove < Formula
  desc "Orchestrates AI-driven development in isolated environments"
  homepage "https://github.com/g4lb/grove"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-arm64"
      sha256 "16cdefd795b594cdcaea981bc492f07173ab08c5785fa4aefc10b1e79044c669"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-x64"
      sha256 "4acbf87511c57454a2ee29b501e99a528aecf73771ba6a4ab3aadfca1411e5b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-arm64"
      sha256 "01aab04a38a27733943341b1d6747612a041e7a9f47a442e657168440af84285"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-x64"
      sha256 "814f04a778ea5416120d05bdf37e114361715791e2422ce92f49d29ebe4b15b5"
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
