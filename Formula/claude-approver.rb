class ClaudeApprover < Formula
  desc "Flip multiple Claude Code sessions into auto-accept or bypass mode at once"
  homepage "https://github.com/g4lb/claude-approver"
  url "https://github.com/g4lb/claude-approver/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "76390802d6176ebd2f339372e826047a5575a27826ff5f39e5abd714415ec03e"
  license "MIT"
  version "0.1.0"

  def install
    bin.install "claude-accept-all.sh" => "claude-accept-all"
    bin.install "claude-relaunch-bypass.sh" => "claude-relaunch-bypass"
  end

  test do
    assert_predicate bin/"claude-accept-all", :executable?
    assert_predicate bin/"claude-relaunch-bypass", :executable?
  end
end
