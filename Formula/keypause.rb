class Keypause < Formula
  desc "Lock your keyboard and trackpad until you press an activator combo"
  homepage "https://github.com/elijahfriedman/keypause"
  url "https://github.com/elijahfriedman/keypause/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "65fba2f0f2a72450d5dfabb0dc0ccbc0ccd75bb83e135aae32687a7f0fca4c4f"
  license "MIT"

  depends_on macos: :big_sur

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
