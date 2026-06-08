# Bump `version` and the four `sha256` values on each grove release
# (the release workflow prints them in SHASUMS256.txt).
class Grove < Formula
  desc "Orchestrates AI-driven development in isolated environments"
  homepage "https://github.com/g4lb/grove"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-arm64"
      sha256 "19f616b45e09503540b89144ffcb749bc7d1846c0d901d41eb671f3cf758283e"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-darwin-x64"
      sha256 "b3a90b6daa06e750e92936717f3234ee284735fac366a3659efcfd61860eae44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-arm64"
      sha256 "ca5fd6dfe838255fde1ed01beafc7a87e1276ce49ece5c2cfcd6c6a31700c99d"
    end
    on_intel do
      url "https://github.com/g4lb/grove/releases/download/v#{version}/grove-linux-x64"
      sha256 "b72f7a58c576ac8d6138eca0c45b9c81ff3ebda7d2ee3abb512b39617564049f"
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
