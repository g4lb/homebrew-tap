class ClaudeApprover < Formula
  desc "Flip multiple Claude Code sessions into auto-accept or bypass mode at once"
  homepage "https://github.com/g4lb/claude-approver"
  url "https://github.com/g4lb/claude-approver/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "069984ba9e9e2da16a6d0f7d7bf7ba2f5dedf353e0135fa9e69e20b1b3bcd62b"
  license "MIT"
  version "0.1.1"

  def install
    bin.install "claude-accept-all.sh" => "claude-accept-all"
    bin.install "claude-relaunch-bypass.sh" => "claude-relaunch-bypass"
  end

  test do
    assert_predicate bin/"claude-accept-all", :executable?
    assert_predicate bin/"claude-relaunch-bypass", :executable?
  end
end
