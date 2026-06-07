# Bump `version` and the four `sha256` values on each grove release
# (the release workflow prints them in SHASUMS256.txt).
class Grove < Formula
  desc "Orchestrates AI-driven development in isolated environments"
  homepage "https://github.com/g4lb/grove"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-arm64"
      sha256 "02a550dd992771ed80405711d30863ff776e9bb92b8f7b09eee14082dc1952a7"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-x64"
      sha256 "8a61ebd7c7ceb920ebc3a72b7130b6d08483aa955176a67d3ad4887640e42595"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-arm64"
      sha256 "6c1b6f7735a4b9cf96e089451f6243af2dd9d70fab3ee351ece116c92d67ee17"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-x64"
      sha256 "72fb4b01575f69177c7edb644198b6ac7d49db40cfea945089eee6c70295954c"
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
