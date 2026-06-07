# Bump `version` and the four `sha256` values on each grove release
# (the release workflow prints them in SHASUMS256.txt).
class Grove < Formula
  desc "Orchestrates AI-driven development in isolated environments"
  homepage "https://github.com/g4lb/grove"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-arm64"
      sha256 "72e74d29b26b9d3902098a8115a458ee97cb48de875b62f89499289b918e8b2b"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-x64"
      sha256 "4a2933de9f44a08e7166e1a4e7f42e90a3d872c8460916262bfc6dc3ebe353ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-arm64"
      sha256 "04cd811ab8ad1333583c4e9a933839d8959fae941b178cc043a498a4a637db63"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-x64"
      sha256 "8849a3eeaf23f1fb40f504597f37cf4268c0718316c2df74d5c7d69bc58a9981"
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
