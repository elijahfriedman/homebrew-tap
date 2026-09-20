class Keypause < Formula
  desc "Lock your keyboard and trackpad until you press an activator combo"
  homepage "https://github.com/elijahfriedman/keypause"
  url "https://github.com/elijahfriedman/keypause/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "28fa8c2dc9ed05c01aa337737f4d6b5574c14d4d04aa7f88c236b439d22d3fd8"
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
