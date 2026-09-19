class Keypause < Formula
  desc "Lock your keyboard and trackpad until you press an activator combo"
  homepage "https://github.com/elijahfriedman/keypause"
  url "https://github.com/elijahfriedman/keypause/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2eb014d4bebb05497fa4ca69ae007aced75f05f6b06d2e8c2a8eff8a7695556d"
  license "MIT"

  depends_on :macos

  def install
    system "xcodebuild",
           "-project", "keypause.xcodeproj",
           "-scheme", "keypause",
           "-configuration", "Release",
           "CODE_SIGNING_ALLOWED=NO",
           "SYMROOT=build",
           "build"
    bin.install "build/Release/keypause"
  end

  test do
    output = shell_output("#{bin}/keypause --check-permissions")
    assert_match "Accessibility permission:", output
  end
end
